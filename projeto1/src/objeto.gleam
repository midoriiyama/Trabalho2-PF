import jogador.{type Jogador}

pub type Objeto {
  Objeto(
    nome: String,
    descricao: String,
    interacao: fn(Jogador) -> Jogador,
    estado: String,
  )
}

pub fn novo_objeto(
  nome: String,
  desc: String,
  acao: fn(Jogador) -> Jogador,
) -> Objeto {
  Objeto(nome: nome, descricao: desc, interacao: acao, estado: "Visível")
}
