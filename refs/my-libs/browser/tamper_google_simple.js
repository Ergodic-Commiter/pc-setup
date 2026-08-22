// ==UserScript==
// @name         Block Google Sign-In Prompts
// @namespace    https://github.com/dx/userscripts
// @version      1.0
// @description  Hides "Sign in with Google" One Tap prompts using CSS.
// @match        *://*/*
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
  "use strict";

  // Layer 1: CSS for anything that loads synchronously
  const style = document.createElement("style");
  style.textContent = `
    /* Google One Tap container */
    #credential_picker_container,
    #credential_picker_iframe { display: none !important; }
  `;
  (document.head || document.documentElement).appendChild(style);

  // Layer 2: Dynamically injected (Reddit)
  const observer = new MutationObserver(() => {
    const el = document.getElementById("credential_picker_container");
    if (el) el.remove();
    document:.querySelectorAll('iframe[src*="accounts.google.com"]'
      ).forEach(f => f.remove());
  });
  document.addEventListener("DOMContentLoaded", () => {
    observer.observe(document.body, { childList: true, subtree: true });
  });
})();
