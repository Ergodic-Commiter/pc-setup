const fs = require("fs");

function lonely_brackets(inputFile) {
  const substitutions = [
    // Trim, possibly not needed.
    { pattern: / +$/gm, replacement: "" }, 
    // Lonely closing brackets to previous line.
    { pattern: /\n\s*([}\]],?)(?=\n\s*[}\]],?|$)/gm, replacement: " $1" }, 
    // Lonely opening bracket joined with next line.  
    { pattern: /^( *\{)\n +/gm, replacement: "$1 " },
    // If list takes two lines, make it one.  
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
