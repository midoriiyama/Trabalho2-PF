import jogador.{type Jogador}

/// Define um tipo de objeto no jogo
/// Um objeto tem um nome, uma descrição, uma função de interação e um estado
pub type Objeto {
  Objeto(
    nome: String,
    descricao: String,
    interacao: fn(Jogador) -> Jogador,
    estado: String,
  )
}

/// Cria um novo objeto
pub fn novo_objeto(
  nome: String,
  desc: String,
  acao: fn(Jogador) -> Jogador,
) -> Objeto {
  Objeto(nome: nome, descricao: desc, interacao: acao, estado: "Visível")
}
