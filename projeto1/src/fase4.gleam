import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}

@external(javascript, "../../../../readline_bridge.mjs", "write_file")
fn write_file(path: String, content: String) -> Bool

/// Ponto de entrada da Fase 4
/// Exibe a narrativa inicial da fase, depois que o usuário conseguiu parar o loop infinito
/// A fase envolve acessar o servidor SQL com credenciais de ROOT
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
  io.println("\nCONSOLE SQL: ATIVO (Privilégios de DELETE habilitados)")
  io.println("IDENTIFIQUE A TABELA E O NOME DO VÍRUS PARA REMOVÊ-LO")
  io.println(
    "________________________________________________________________________\n",
  )
}

/// Relatório final de vitória e salva em um arquivo
/// O relatório inclui detalhes sobre as ações tomadas, o status do sistema e uma mensagem de parabéns
/// O arquivo é salvo como 'FINAL_RELATORIO_VITORIA.txt' na pasta do usuário
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

  let _ = write_file("Relatorio_final.txt", conteudo)

  io.println("\nDownload do relatório completo...")
  io.println("O arquivo 'Relatorio_final.txt' foi gerado na sua pasta!")
}

/// Função que finaliza o jogo, removendo o processo malicioso do banco de dados
/// Exibe mensagens de sucesso e gera o certificado de vitória
fn finalizar_jogo(j: Jogador) -> Jogador {
  io.println(
    "\n________________________________________________________________________\n",
  )
  io.println(
    "EXECUTANDO:\nDELETE FROM processos_ativos WHERE nome = 'Hacker_Moodle'",
  )
  io.println(">> 1 linha afetada")
  io.println(">> Processo malicioso removido com sucesso")
  io.println(">> O sistema está seguro")
  io.println(
    "________________________________________________________________________\n",
  )
  gerar_certificado()

  jogador.adiciona_item(j, "VITORIA_FINAL")
}

/// Enigma que solicita ao usuário o comando SQL para deletar o vírus do Moodle
/// O usuário deve inserir o comando DELETE correto
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

/// Objeto que exibe o schema da tabela de processos ativos
/// Mostra a estrutura da tabela e os processos ativos, incluindo o vírus do Moodle
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

/// Cria o ambiente do servidor SQL, onde o usuário pode interagir com o enigma
/// Inclui o enigma SQL e o objeto do schema da tabela
pub fn ambiente_servidor_sql() -> Ambiente {
  ambiente.novo_ambiente(
    "Servidor SQL (Console Root)",
    "Um terminal preto aguarda seus comandos. O tempo está acabando...",
    [obj_schema_tabela()],
    ["FIM"],
    [enigma_sql()],
  )
}
