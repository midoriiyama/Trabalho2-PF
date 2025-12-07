import jogador.{type Jogador}

/// Define o tipo Enigma com seus atributos
/// Um enigma possui uma descrição, uma solução, uma lista de dicas e uma ação associada
pub type Enigma {
  Enigma(
    descricao: String,
    solucao: String,
    dicas: List(String),
    acao: fn(Jogador) -> Jogador,
  )
}

/// Cria um novo enigma
pub fn novo_enigma(
  pergunta: String,
  resp: String,
  dicas: List(String),
  acao: fn(Jogador) -> Jogador,
) -> Enigma {
  Enigma(descricao: pergunta, solucao: resp, dicas: dicas, acao: acao)
}
