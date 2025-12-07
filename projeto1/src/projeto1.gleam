import ambiente.{type Ambiente}
import fase1
import fase2
import fase3
import fase4
import gleam/int
import gleam/io
import gleam/list
import gleam/string
import jogador.{type Jogador}
import jogo

/// Ponte com o javascript para ler a entrada do usuário-
@external(javascript, "../../../../readline_bridge.mjs", "question")
pub fn question(prompt: String) -> String

/// Inicia o jogo e executanto um loop
/// O loop verifica o nível de alerta do jogador e se ele venceu ou perdeu
fn game_loop(sala_atual: Ambiente, hacker: Jogador) {
  //Verifica se o nível de alerta estourou
  case hacker.nivel_alerta >= 100 {
    True -> {
      mostra_derrota()
    }
    False -> {
      //Caso não estourou, verifica Vitória (Fim da Fase 4)
      verifica_vitoria(hacker, sala_atual)
    }
  }
}

/// Exibe mensagem de derrota quando o nível de alerta chega a 100%
fn mostra_derrota() {
  io.println("\n💀 GAME OVER! 💀")
  io.println("      ,-=-.      ")
  io.println("     | ~~~ |     ")
  io.println("     |R.I.P|     ")
  io.println("     |_____|     ")
  io.println("    V,VV,,V,V    ")
  io.println("Nível de Detecção: 100%.")
  io.println(
    "Sua conexão foi rastreada. O hacker invandiu o seu computador também",
  )
}

/// Verifica se o jogador tem o item "VITORIA_FINAL", que é obtido ao completar a Fase 4
/// Se sim, exibe mensagem de vitória e encerra o jogo
/// Se não, inicia a transição para a próxima fase (fase 1 -> fase 2)
fn verifica_vitoria(hacker: Jogador, sala_atual: Ambiente) {
  case jogador.tem_item(hacker, "VITORIA_FINAL") {
    True -> {
      io.println(
        "Pode fechar o terminal, ler o arquivo gerado e ir comemorar!!!",
      )
      Nil
    }
    False -> {
      transicao_fase2(hacker, sala_atual)
    }
  }
}

/// Transições entre as fases do jogo, verificando os itens necessários e o ambiente
/// Cada transição chama a função `game_loop` com o novo ambiente e o jogador atualizado
fn transicao_fase2(hacker: Jogador, sala_atual: Ambiente) {
  case
    jogador.tem_item(hacker, "Conexao_SSH_Ativa")
    && string.contains(sala_atual.nome, "Disciplina")
  {
    True -> {
      fase2.contexto_f2()
      game_loop(fase2.ambiente_adm(), hacker)
    }
    False -> {
      // Transição 2 -> 3 (Requer: Credencial_Root_SQL)

      transicao_fase3(hacker, sala_atual)
    }
  }
}

fn transicao_fase3(hacker: Jogador, sala_atual: Ambiente) {
  case
    jogador.tem_item(hacker, "Credencial_Root_SQL")
    && string.contains(sala_atual.nome, "Terminal")
  {
    True -> {
      fase3.contexto_f3()
      game_loop(fase3.ambiente_cpu(), hacker)
    }
    False -> {
      // Transição 3 -> 4 (Requer: Acesso_Banco_Dados)
      transicao_fase4(hacker, sala_atual)
    }
  }
}

fn transicao_fase4(hacker: Jogador, sala_atual: Ambiente) {
  case
    jogador.tem_item(hacker, "Acesso_Banco_Dados")
    && string.contains(sala_atual.nome, "Processador")
  {
    True -> {
      fase4.contexto_f4()
      game_loop(fase4.ambiente_servidor_sql(), hacker)
    }
    False -> {
      //O JOGO RODA AQUI (Se não mudou de fase)
      executar_rodada(sala_atual, hacker)
    }
  }
}

/// Função auxiliar para processar comandos
/// Exibe o ambiente atual, os itens do jogador e os comandos disponíveis
/// Dependendo do ambiente, exibe comandos de navegação específicos
/// Processa o comando do usuário e chama a função apropriada
/// Se o comando for "Sair", encerra o jogo
fn executar_rodada(sala_atual: Ambiente, hacker: Jogador) {
  io.println(
    "\n========================================================================\n",
  )
  io.println("                 📍 " <> sala_atual.nome)
  io.println(
    "                        ALERTA: "
    <> int.to_string(hacker.nivel_alerta)
    <> "% | ITENS: "
    <> int.to_string(list.length(hacker.inventario)),
  )
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("           Comandos: [Investigar] [Pegar] [Hackear] [Mochila]")

  // Comandos de navegação da Fase 1
  case string.contains(sala_atual.nome, "Disciplinas Disponíveis") {
    True -> io.println("                Navegação: [Ir 1] [Ir 2] [Ir 3] [Ir 4]")
    False -> Nil
  }
  case string.contains(sala_atual.nome, "Disciplina ") {
    True -> io.println("               Navegação: [Voltar]")
    False -> Nil
  }

  let comando = question("\nDigite: ")

  case comando {
    "Sair" -> io.println("Desconectando...")

    "Investigar" -> {
      io.println(jogo.explorar(sala_atual, hacker))
      game_loop(sala_atual, hacker)
    }

    "Mochila" -> {
      io.println(
        "\n========================================================================",
      )
      io.println("\n                           SEU INVENTÁRIO:\n")
      list.each(hacker.inventario, fn(i) { io.println(" - " <> i) })
      game_loop(sala_atual, hacker)
    }

    "Pegar" -> {
      case list.first(sala_atual.objetos) {
        Ok(obj) -> {
          io.println(">> Interagindo com: " <> obj.nome)
          let novo_hacker = jogo.interagir(obj, hacker)
          game_loop(sala_atual, novo_hacker)
        }
        Error(Nil) -> {
          io.println(
            "\n========================================================================",
          )
          io.println("\n>> Não há nada útil aqui.")
          game_loop(sala_atual, hacker)
        }
      }
    }

    "Hackear" -> {
      case list.first(sala_atual.enigmas) {
        Ok(enigma) -> {
          io.println(
            "\n========================================================================",
          )
          io.println("\n🔐 " <> enigma.descricao)

          io.println("\nDigite 'Voltar' para retornar a página anterior")
          let tentativa = question("Digite a resposta: ")
          case tentativa == "Voltar" {
            True -> game_loop(sala_atual, hacker)
            False -> {
              let novo_hacker = jogo.resolver_enigma(enigma, tentativa, hacker)
              // Verifica se acertou (se ganhou item novo)
              verifica_acerto(hacker, novo_hacker, sala_atual)
            }
          }
        }
        Error(Nil) -> {
          io.println(">> Nenhum sistema vulnerável detectado.")
          game_loop(sala_atual, hacker)
        }
      }
    }

    // Navegação Fase 1
    "Ir 1" -> game_loop(fase1.entrar_no_ambiente(1), hacker)
    "Ir 2" -> game_loop(fase1.entrar_no_ambiente(2), hacker)
    "Ir 3" -> game_loop(fase1.entrar_no_ambiente(3), hacker)
    "Ir 4" -> game_loop(fase1.entrar_no_ambiente(4), hacker)
    "Voltar" -> game_loop(fase1.entrar_no_ambiente(0), hacker)

    _ -> {
      io.println("Comando desconhecido.")
      game_loop(sala_atual, hacker)
    }
  }
}

fn verifica_acerto(hacker: Jogador, novo_hacker: Jogador, sala_atual: Ambiente) {
  case list.length(novo_hacker.inventario) > list.length(hacker.inventario) {
    True -> {
      io.println("\n✅ ACESSO CONCEDIDO!")
      game_loop(sala_atual, novo_hacker)
    }
    False -> {
      io.println("\n❌ ACESSO NEGADO! O sistema detectou a intrusão.")
      io.println("⚠️  Nível de Alerta +20%")
      // Aumenta o alerta (Dano)
      let hacker_punido = jogador.aumentar_alerta(hacker, 20)
      game_loop(sala_atual, hacker_punido)
      io.println("_________________________________________________________\n")
    }
  }
}

pub fn main() {
  let hacker_inicial = jogador.novo_jogador("Aluno", "Inicio")

  fase1.contexto_f1()
  let sala_inicial = fase1.ambiente_disciplina()

  game_loop(sala_inicial, hacker_inicial)
}
