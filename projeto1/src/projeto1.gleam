import gleam/io

@external(javascript, "../../../../readline_bridge.mjs", "question")
pub fn question(prompt: String) -> String

pub fn main() {
  let nome = question("Qual e o seu nome? ")
  io.println("Olá, " <> nome <> "!")
}