import * as readlineSync from "readline-sync";

// A função 'question' é exportada para ser usada pelo Gleam
export function question(prompt) {
  // Usa a biblioteca 'readline-sync' que foi instalada via npm
  return readlineSync.question(prompt);
}
