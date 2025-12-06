import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/list
import gleam/string
import jogador.{type Jogador}
import objeto.{type Objeto}

pub fn explorar(amb: Ambiente, _jog: Jogador) -> String {
  let objetos_txt = list.map(amb.objetos, fn(obj) { "   - " <> obj.nome })

  let saidas_txt = list.map(amb.saidas, fn(s) { "[" <> s <> "]" })

  string.join(
    [
      "\n========================================",
      "LOCAL ATUAL: " <> amb.nome,
      "========================================",
      amb.descricao,
      "",
      "O QUE VOCÊ VÊ (Objetos):",
      case list.is_empty(objetos_txt) {
        True -> "   (Nenhum objeto interativo visível)"
        False -> string.join(objetos_txt, "\n")
      },
      "",
      "PARA ONDE IR (Saídas):",
      case list.is_empty(saidas_txt) {
        True -> "   (Sem saídas visíveis - Caminho Bloqueado)"
        False -> string.join(saidas_txt, "  ")
      },
    ],
    "\n",
  )
}

pub fn interagir(obj: Objeto, jog: Jogador) -> Jogador {
  obj.interacao(jog)
}

pub fn resolver_enigma(enig: Enigma, resposta: String, jog: Jogador) -> Jogador {
  case resposta == enig.solucao {
    True -> {
      enig.acao(jog)
    }

    False -> {
      jog
    }
  }
}
