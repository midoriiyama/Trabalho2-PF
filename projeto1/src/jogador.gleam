//import gleam/list

pub type Jogador {
  Jogador(
    nome: String,
    inventario: List(String),
    nivel_alerta: Int,
    localizacao: String,
  )
}

pub fn novo_jogador(nome: String, localizacao: String) -> Jogador {
  Jogador(nome, [], 0, localizacao)
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

pub fn aumentar_alerta(jogador: Jogador, quantidade: Int) -> Jogador {
  let novo_nivel = jogador.nivel_alerta + quantidade

  case novo_nivel > 100 {
    True -> Jogador(..jogador, nivel_alerta: 100)
    False -> Jogador(..jogador, nivel_alerta: novo_nivel)
  }
}
