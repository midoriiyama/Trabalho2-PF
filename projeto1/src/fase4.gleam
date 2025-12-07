import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}

@external(javascript, "../../../../readline_bridge.mjs", "write_file")
fn write_file(path: String, content: String) -> Bool

pub fn contexto_f4() {
  io.println(
    "\n\n\n========================================================================\n",
  )
  io.println("Você usou a credencial de ROOT para acessar o servidor de dados")
  io.println("Diante de você, um terminal pisca um símbolo em ASCII")
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░")
  io.println("░░░░░░░░░░▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄░░░░░░░░░")
  io.println("░░░░░░░░▄▀░░░░░░░░░░░░▄░░░░░░░▀▄░░░░░░░")
  io.println("░░░░░░░░█░░▄░░░░▄░░░░░░░░░░░░░░█░░░░░░░")
  io.println("░░░░░░░░█░░░░░░░░░░░░▄█▄▄░░▄░░░█░▄▄▄░░░")
  io.println("░▄▄▄▄▄░░█░░░░░░▀░░░░▀█░░▀▄░░░░░█▀▀░██░░")
  io.println("░██▄▀██▄█░░░▄░░░░░░░██░░░░▀▀▀▀▀░░░░██░░")
  io.println("░░▀██▄▀██░░░░░░░░▀░██▀░░░░░░░░░░░░░▀██░")
  io.println("░░░░▀████░▀░░░░▄░░░██░░░▄█░░░░▄░▄█░░██░")
  io.println("░░░░░░░▀█░░░░▄░░░░░██░░░░▄░░░▄░░▄░░░██░")
  io.println("░░░░░░░▄█▄░░░░░░░░░░░▀▄░░▀▀▀▀▀▀▀▀░░▄▀░░")
  io.println("░░░░░░█▀▀█████████▀▀▀▀████████████▀░░░░")
  io.println("░░░░░░████▀░░███▀░░░░░░▀███░░▀██▀░░░░░░")
  io.println("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░")
  io.println("")
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("O Hacker do Moodle está ativo e deletando tabelas!")
  io.println(
    "\n[SISTEMA] CONSOLE SQL: ATIVO (Privilégios de DELETE habilitados)",
  )
  io.println("[SISTEMA] IDENTIFIQUE A TABELA E O NOME DO VÍRUS PARA REMOVÊ-LO")
  io.println(
    "________________________________________________________________________\n",
  )
}

fn gerar_certificado() {
  let conteudo =
    "
  UNIVERSIDADE ESTADUAL DE MARINGÁ (UEM)
  DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO
  --------------------------------------------------
  RELATÓRIO FINAL: SUCESSO NA RECUPERAÇÃO DO MOODLE
  --------------------------------------------------

  DATA: Hoje
  AGENTE: Estudante de Computação

  RESUMO DAS AÇÕES:
  [x] IP do invasor rastreado (192.168.0.1)
  [x] Acesso Root obtido (Senha: JUJUBA)
  [x] Loop Infinito corrigido (Patch: recuperar_sistema)
  [x] Banco de Dados limpo (Comando DELETE SQL)

  STATUS DO SISTEMA:
  O Moodle foi restaurado
  As notas do semestre estão salvas

  PARABÉNS! VOCÊ SALVOU O SEMESTRE
  Mas o Hacker acabou de começar... Fique atento para futuras ameaças
  "

  let _ = write_file("FINAL_RELATORIO_VITORIA.txt", conteudo)

  io.println("\n✨ [SISTEMA] Download do relatório completo...")
  io.println(
    "✨ [VITÓRIA] O arquivo 'FINAL_RELATORIO_VITORIA.txt' foi gerado na sua pasta!",
  )
}

fn finalizar_jogo(j: Jogador) -> Jogador {
  io.println(
    "\n________________________________________________________________________\n",
  )
  io.println(
    "> [SQL] EXECUTANDO:\nDELETE FROM processos_ativos WHERE nome = 'Moodle_Reaper'",
  )
  io.println(">> [DB] 1 linha afetada")
  io.println(">> [DB] Processo malicioso removido com sucesso")
  io.println(">> [SISTEMA] O sistema está seguro")
  io.println(
    "________________________________________________________________________\n",
  )
  gerar_certificado()

  jogador.adiciona_item(j, "VITORIA_FINAL")
}

fn enigma_sql() -> Enigma {
  enigma.novo_enigma(
    "CONSOLE SQL > Digite o comando DELETE completo para apagar o vírus:",
    "DELETE FROM processos_ativos WHERE nome = 'Hacker_Moodle'",
    [
      "Sintaxe: DELETE FROM [tabela] WHERE [coluna] = 'valor'",
      "Olhe o Schema da Tabela (objeto) para ver os nomes",
      "O nome do vírus deve estar entre aspas simples ('')",
    ],
    finalizar_jogo,
  )
}

fn obj_schema_tabela() -> Objeto {
  objeto.novo_objeto(
    "Schema do Banco de Dados",
    "Você consulta a estrutura das tabelas ativas",
    fn(j) {
      io.println("\n--- TABELA: processos_ativos ---")
      io.println("| id  | nome            | status  |")
      io.println("|-----|-----------------|---------|")
      io.println("| 001 | System_Kernel   | OK      |")
      io.println("| 666 | Hacker_Moodle   | MALWARE |")
      j
    },
  )
}

pub fn carregar() -> Ambiente {
  let sala =
    ambiente.novo_ambiente(
      "Servidor SQL (Console Root)",
      "Um terminal preto aguarda seus comandos. O tempo está acabando...",
      [],
      [],
      [],
    )

  ambiente.Ambiente(
    ..sala,
    enigmas: [enigma_sql()],
    objetos: [obj_schema_tabela()],
    saidas: ["FIM"],
  )
}
