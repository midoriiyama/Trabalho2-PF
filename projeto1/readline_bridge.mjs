import readline from 'readline-sync';
import fs from 'node:fs';

// Função de Input
export function question(prompt) {
  return readline.question(prompt);
}

// Função de Arquivos
export function write_file(path, content) {
  try {
    fs.writeFileSync(path, content);
    return true;
  } catch (err) {
    console.error("Erro ao escrever arquivo:", err);
    return false;
  }
}
