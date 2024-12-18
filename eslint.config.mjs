import globals from "globals";
import pluginJs from "@eslint/js";

import json from "@eslint/json";
import markdown from "@eslint/markdown";
//import prettier from "eslint-plugin-prettier";
//import prettierConfig from "eslint-config-prettier";

/** @type {import('eslint').Linter.Config[]} */
export default [
  { name: "Global Config",
    languageOptions: {
      globals: {
        ...globals.browser,
        process: "readonly" } } },
  pluginJs.configs.recommended,
  { name: "JS Config",
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "commonjs",
      env: {
        node: true,
        es6: true } } },
  { name: "JSON Config w.Prettier",
    language: "json/json",
    files: ["**/*.json"],
    // plugins: {json, prettier},
    plugins: { json },
    rules: {
      "no-irregular-whitespace": "off", // Estaba fallando así que lo apagamos.
      "json/no-duplicate-keys": "error" } },
      // "prettier/prettier": ["error", {parser: "json"}] } },
  { name: "Markdown Config",
    language: "markdown/commonmark",
    files: ["**/*.md"],
    plugins: { markdown },
    rules: { "markdown/no-html": "error" } }
  // prettierConfig
];
