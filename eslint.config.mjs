import globals from "globals";
import pluginJs from "@eslint/js";
import json from "eslint-plugin-json";


/** @type {import('eslint').Linter.Config[]} */
export default [
{ files: ["**/*.json"], 
  ...json.configs["recommended"] }, 
{ files: ["**/*.js"], 
  languageOptions: {
    sourceType: "commonjs",
    globals: globals.browser },
  ...pluginJs.configs.recommended },
];
