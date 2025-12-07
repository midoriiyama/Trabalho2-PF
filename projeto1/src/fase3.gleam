import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}

@external(javascript, "../../../../readline_bridge.mjs", "question")
pub fn question(prompt: String) -> String

pub fn contexto_f3() {
  io.println(
    "\n\n\n========================================================================\n",
  )
  io.println("*Eu consegui o acesso de administrador, mas algo está errado...*")
  io.println(
    "*O processador está sobrecarregado, a memória RAM está quase cheia*",
  )
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("Buscar fonte do problema [ENTER PARA CONTINUAR]")
  case question("") {
    _ -> entra_problema()
  }
  io.println(
    "________________________________________________________________________\n",
  )
}

pub fn entra_problema() {
  io.println("")
  io.println("                          MM                                ")
  io.println("                         MM##                                ")
  io.println("                        ####mm                              ")
  io.println("                       MM######                              ")
  io.println("                      ########mm                            ")
  io.println("                     mm##########                            ")
  io.println("                    ############mm                          ")
  io.println("                    ################                        ")
  io.println(
    "     ##############################################                 ",
  )
  io.println(
    "     ##############################################               ",
  )
  io.println(
    "       ##########################################                 ",
  )
  io.println(
    "         ######################################                     ",
  )
  io.println(
    "           ##################################                      ",
  )
  io.println(
    "             ##############################                         ",
  )
  io.println(
    "               ##########################                          ",
  )
  io.println(
    "               ##########################                          ",
  )
  io.println(
    "               ###########################                          ",
  )
  io.println(
    "               ##########################                           ",
  )
  io.println(
    "              ############################                           ",
  )
  io.println(
    "              ##############  ############                           ",
  )
  io.println(
    "              ##########          ########                           ",
  )
  io.println(
    "              ######                ######                         ",
  )
  io.println(
    "              ##                        ##                         ",
  )
  io.println("")
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("ATENÇÃO: O sistema está em risco!")
  io.println(
    "Você precisa encontrar o 'CASO BASE' para interromper a recursão:\n\n",
  )

  exibir_codigo_virus()
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("*Meu deus, eu preciso parar isso rapidamente*")
}

pub fn exibir_codigo_virus() {
  io.println("  // ARQUIVO: nucleo_sistema.gleam")
  io.println("  // STATUS: CRÍTICO")
  io.println("  ")
  io.println("  pub fn loop_destrutivo(comando: List(String)) {")
  io.println("    case comando {")
  io.println("      ")
  io.println("      PARAR_RECURSAO -> manter_loop()")
  io.println("      _ -> {")
  io.println("        consumir_memoria()")
  io.println("        loop_destrutivo(comando) ")
  io.println("      }")
  io.println("    }")
  io.println("  }")
}

fn obj_terminal_debug() -> Objeto {
  objeto.novo_objeto(
    "Terminal de Debug",
    "Um terminal usado para monitorar processos do sistema.",
    fn(j) {
      io.println(
        ">> O sistema permite substituir a chamada de função no Caso Base",
      )
      io.println(">> Dê um jeito de recuperar o sistema")
      j
    },
  )
}

fn liberar_fase4(j: Jogador) -> Jogador {
  io.println(
    "________________________________________________________________________\n",
  )
  io.println(">> Aplicando alteração no código-fonte...")
  io.println(">>  - manter_loop()")
  io.println(">>  + recuperar_sistema()")
  io.println(">> Loop interrompido com sucesso. Memória estável")
  jogador.adiciona_item(j, "Acesso_Banco_Dados")
}

fn enigma_patch() -> Enigma {
  enigma.novo_enigma(
    "Qual o nome da função que deve ser chamada no lugar de 'manter_loop()'?",
    "recuperar_sistema()",
    ["Leia o código na tela acima", "A função correta começa com 'recuperar_'"],
    liberar_fase4,
  )
}

pub fn carregar() -> Ambiente {
  ambiente.novo_ambiente(
    "Núcleo do Processador",
    "Um ambiente abstrato de código puro",
    [obj_terminal_debug()],
    ["Banco de Dados (Fase 4)"],
    [enigma_patch()],
  )
}
