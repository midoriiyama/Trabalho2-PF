pub type Objeto {
  Objeto(
    nome: String,
    descricao: String,
    interacao: fn(Jogador) -> Jogador,
    estado: String,
  )
}

fn novo_objeto(
  nome: String,
  localizacao: String,
  jogador: Jogador,
  estado: String,
) -> Objeto {
  Objeto(nome, localizacao, fn(j) { j }, estado)
}
