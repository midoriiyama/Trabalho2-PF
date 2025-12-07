import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/list
import gleam/string
import jogador.{type Jogador}
import objeto.{type Objeto}

/// Explora o ambiente atual do jogo, mostrando detalhes sobre objetos e saídas.
pub fn explorar(amb: Ambiente, _jog: Jogador) -> String {
  let objetos_txt = list.map(amb.objetos, fn(obj) { "   - " <> obj.nome })
  string.join(
    [
      "\n========================================================================",
      "        INVESTIGAR LOCAL ATUAL: " <> amb.nome,
      "========================================================================\n",
      amb.descricao,
      "",
      "O que há na sala:",
      case list.is_empty(objetos_txt) {
        True -> "   (Nenhum objeto interativo visível)"
        False -> string.join(objetos_txt, "\n")
      },
      "",
    ],
    "\n",
  )
}

/// Interage com um objeto no ambiente atual do jogo, modificando o estado do jogador
pub fn interagir(obj: Objeto, jog: Jogador) -> Jogador {
  obj.interacao(jog)
}

/// Resolve um enigma, aplicando a ação associada se a resposta estiver correta
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
