//import gleam/list

pub type Jogador {
  Jogador(
    nome: String,
    inventario: List(String),
    pontos_de_vida: Int,
    localizacao: String,
  )
}

pub fn novo_jogador(nome: String, localizacao: String) -> Jogador {
  Jogador(nome, [], 100, localizacao)
}

pub fn adiciona_item(jogador: Jogador, item: String) -> Jogador {
  Jogador(..jogador, inventario: [item, ..jogador.inventario])
}

pub fn tem_item(jogador: Jogador, item: String) -> Bool {
  possui_item_recursivo(jogador.inventario, item)
}

fn possui_item_recursivo(inventario: List(String), item_buscado: String) -> Bool {
  case inventario {
    [] -> False
    [primeiro, ..] if primeiro == item_buscado -> True
    [_, ..resto] -> possui_item_recursivo(resto, item_buscado)
  }
}

pub fn recebe_dano(jogador: Jogador, dano: Int) -> Jogador {
  let vida_atualizada = jogador.pontos_de_vida - dano
  case vida_atualizada < 0 {
    True -> Jogador(..jogador, pontos_de_vida: 0)
    False -> Jogador(..jogador, pontos_de_vida: vida_atualizada)
  }
}
