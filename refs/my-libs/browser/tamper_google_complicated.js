// ==UserScript==
// @name         Block Google Sign-Ins
// @namespace    https://github.com/dx/userscripts
// @version      1.3
// @description  Hides "Sign in with Google" modals, banners, One Tap prompts, and login nags across websites.
// @author       DX
// @match        *://*/*
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
  'use strict';

  // ─── CSS: Hide common Google sign-in UI elements immediately ───────────────
  const css = `
    /* Google One Tap prompt */
    #credential_picker_container,
    #credential_picker_iframe,
    iframe[src*="accounts.google.com/gsi"],
    div[id^="gsi_"] { display: none !important; }

    /* Sites that wrap One Tap in an overlay */
    div[class*="google-one-tap"],
    div[id*="google-one-tap"],
    div[class*="GoogleOneTap"],
    div[id*="GoogleOneTap"] { display: none !important; }

    /* Generic "sign in with Google" banners / modals (heuristic) */
    [class*="signin-google"],
    [class*="sign-in-google"],
    [class*="google-signin"],
    [class*="google-login"],
    [class*="googleLogin"],
    [id*="google-signin-prompt"],
    [id*="google_signin_prompt"] { display: none !important; }
  `;

  const injectStyle = () => {
    const style = document.createElement('style');
    style.id = 'dx-block-google-signin';
    style.textContent = css;
    (document.head || document.documentElement).appendChild(style);
  };

  injectStyle();

  // ─── Block the Google GSI (identity services) script from loading ──────────
  // This prevents One Tap from initialising at all.
  const BLOCKED_SCRIPTS = [
    'accounts.google.com/gsi/client',
    'apis.google.com/js/platform.js',
    'accounts.google.com/o/gsi/',
  ];

  const origCreateElement = document.createElement.bind(document);
  document.createElement = function (tag, ...args) {
    const el = origCreateElement(tag, ...args);
    if (tag.toLowerCase() === 'script') {
      const origSetAttribute = el.setAttribute.bind(el);
      el.setAttribute = function (attr, value) {
        if (attr === 'src' && BLOCKED_SCRIPTS.some(s => value && value.includes(s))) {
          console.debug('[block-google-signin] Blocked script:', value);
          return; // silently drop the src
        }
        return origSetAttribute(attr, value);
      };
      // Also intercept direct .src = "..." assignment
      let _src = '';
      Object.defineProperty(el, 'src', {
        get: () => _src,
        set: (value) => {
          if (BLOCKED_SCRIPTS.some(s => value && value.includes(s))) {
            console.debug('[block-google-signin] Blocked script src assignment:', value);
            return;
          }
          _src = value;
          origSetAttribute('src', value);
        },
        configurable: true,
      });
    }
    return el;
  };

  // ─── Block GSI iframes and fetch/XHR calls ────────────────────────────────
  const BLOCKED_IFRAME_SRCS = [
    'accounts.google.com/gsi',
    'accounts.google.com/o/oauth2',
  ];

  // Intercept iframe src assignments too
  const origIframeDescriptor = Object.getOwnPropertyDescriptor(HTMLIFrameElement.prototype, 'src');
  if (origIframeDescriptor) {
    Object.defineProperty(HTMLIFrameElement.prototype, 'src', {
      get: origIframeDescriptor.get,
      set: function (value) {
        if (BLOCKED_IFRAME_SRCS.some(s => value && value.includes(s))) {
          console.debug('[block-google-signin] Blocked iframe src:', value);
          return;
        }
        origIframeDescriptor.set.call(this, value);
      },
      configurable: true,
    });
  }

  // ─── MutationObserver: Remove injected One Tap containers after load ───────
  // Some sites inject these dynamically after DOMContentLoaded.
  const REMOVE_SELECTORS = [
    '#credential_picker_container',
    '#g_id_onload',
    'div[id^="gsi_"]',
    'iframe[src*="accounts.google.com/gsi"]',
    'div[class*="google-one-tap"]',
    'div[id*="google-one-tap"]',
  ];

  const removeElements = () => {
    REMOVE_SELECTORS.forEach(sel => {
      document.querySelectorAll(sel).forEach(el => {
        console.debug('[block-google-signin] Removing:', sel);
        el.remove();
      });
    });
  };

  const observer = new MutationObserver(() => removeElements());

  // Start observing once the document body exists
  const startObserver = () => {
    observer.observe(document.body || document.documentElement, {
      childList: true,
      subtree: true,
    });
  };

  if (document.body) {
    startObserver();
  } else {
    document.addEventListener('DOMContentLoaded', startObserver);
  }

  // ─── Nuke the google.accounts.id API object if it sneaks in ───────────────
  // Some sites call google.accounts.id.prompt() to trigger One Tap.
  // We replace it with a no-op after page load.
  window.addEventListener('load', () => {
    try {
      if (window.google && window.google.accounts && window.google.accounts.id) {
        window.google.accounts.id.prompt = () => {};
        window.google.accounts.id.initialize = () => {};
        console.debug('[block-google-signin] Neutered google.accounts.id');
      }
    } catch (e) { /* cross-origin guard */ }
  });

})();