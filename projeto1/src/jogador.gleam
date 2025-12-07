/// Define um tipo de jogador
/// Um jogador tem um nome, um inventário de itens, um nível de alerta e uma localização atual
pub type Jogador {
  Jogador(
    nome: String,
    inventario: List(String),
    nivel_alerta: Int,
    localizacao: String,
  )
}

/// Cria um novo jogador com o inventário vazio e o nível de alerta em zero
pub fn novo_jogador(nome: String, localizacao: String) -> Jogador {
  Jogador(nome, [], 0, localizacao)
}

/// Adiciona um item ao inventário do jogador
pub fn adiciona_item(jogador: Jogador, item: String) -> Jogador {
  Jogador(..jogador, inventario: [item, ..jogador.inventario])
}

/// Verifica se o jogador possui um item específico no inventário
pub fn tem_item(jogador: Jogador, item: String) -> Bool {
  possui_item_recursivo(jogador.inventario, item)
}

/// Função auxiliar recursiva para verificar a presença de um item no inventário
fn possui_item_recursivo(inventario: List(String), item_buscado: String) -> Bool {
  case inventario {
    [] -> False
    [primeiro, ..] if primeiro == item_buscado -> True
    [_, ..resto] -> possui_item_recursivo(resto, item_buscado)
  }
}

/// Aumenta o nível de alerta do jogador em uma quantidade específica, sem ultrapassar 100
pub fn aumentar_alerta(jogador: Jogador, quantidade: Int) -> Jogador {
  let novo_nivel = jogador.nivel_alerta + quantidade

  case novo_nivel > 100 {
    True -> Jogador(..jogador, nivel_alerta: 100)
    False -> Jogador(..jogador, nivel_alerta: novo_nivel)
  }
}
