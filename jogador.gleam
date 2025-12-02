import gleam/list

pub type Jogador {
  Jogador(
    nome: String,
    inventario: List(String),
    pontos_de_vida: Int,
    localizacao: String,
  )
}

fn novo_jogador(nome: String, local: String) -> Jogador {
  Jogador(nome, [], 100, local)
}

fn adiciona_item(jogador: Jogador, item: String) -> Jogador {
  Jogador(..jogador, inventario: list.append(jogador.inventario, [item]))
}

fn remove_item(jogador: Jogador, item_a_remover: String) -> Jogador {
  let novo_inventario =
    list.filter(jogador.inventario, fn(item) { item != item_a_remover })
  Jogador(..jogador, inventario: novo_inventario)
}

fn busca_item(jogador: Jogador, item_buscado: String) -> Bool {
  list.contains(jogador.inventario, item_buscado)
}

fn recebe_dano(jogador: Jogador, dano: Int) -> Jogador {
  let vida_atualizada = jogador.pontos_de_vida - dano
  case vida_atualizada < 0 {
    True -> Jogador(..jogador, pontos_de_vida: 0)
    False -> Jogador(..jogador, pontos_de_vida: vida_atualizada)
  }
}
