// Arquivo: readline_bridge.mjs
import readline from 'readline-sync';
import fs from 'node:fs'; // Importante: Importa o sistema de arquivos

// Função usada pelo jogo.gleam e main.gleam para ler input
export function question(prompt) {
  return readline.question(prompt);
}

// Função usada pela fase2 e fase3 para criar arquivos reais (.txt)
export function write_file(path, content) {
  try {
    fs.writeFileSync(path, content);
    return true; // Sucesso
  } catch (err) {
    console.error("Erro ao escrever arquivo:", err);
    return false; // Falha
  }
}