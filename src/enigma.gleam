import jogador.{type Jogador}

pub type Enigma {
  Enigma(
    descricao: String,
    solucao: String,
    dicas: List(String),
    acao: fn(Jogador) -> Jogador,
  )
}

pub fn novo_enigma(
  pergunta: String,
  resp: String,
  dicas: List(String),
  acao: fn(Jogador) -> Jogador,
) -> Enigma {
  Enigma(descricao: pergunta, solucao: resp, dicas: dicas, acao: acao)
}
