const fs = require("fs");

function lonely_brackets(inputFile) {
  const substitutions = [
    { pattern: / +$/gm, replacement: "" }, // Trim but most likely not needed.
    { pattern: /\n\s*([}\]],?)(?=\n\s*[}\]],?|$)/gm, replacement: " $1" }, // closing brackets to previous line.
    { pattern: /^( *\{)\n +/gm, replacement: "$1 " },
    { pattern: /\[\n\s*(.*?)\s?\]/gm, replacement: "[ $1 ]" } ];
  try {
    let content = fs.readFileSync(inputFile, "utf8");
    substitutions.forEach(({ pattern, replacement }) => {
      content = content.replace(pattern, replacement) } );
    fs.writeFileSync(inputFile, content, "utf8");
  } catch (error) {
    console.error(`Error processing file "${inputFile}":`, error.message);
    process.exit(1);
  }
}

if (require.main === module) {
  const inputFilePath = process.argv[2];
  if (!inputFilePath) {
    console.error("Usage: node script.js <inputFilePath>");
    process.exit(1);
  }
  lonely_brackets(inputFilePath);
}
