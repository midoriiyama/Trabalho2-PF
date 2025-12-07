import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}

@external(javascript, "../../../../readline_bridge.mjs", "question")
pub fn question(prompt: String) -> String

/// Ponto de entrada da Fase 1
/// Exibe a narrativa inicial da fase e inicia o jogo
pub fn contexto_f1() {
  io.println(
    "________________________________________________________________________\n",
  )
  io.println(
    " Você é aluno de Ciência da Computação da UEM, convocado pelo professor",
  )
  io.println(
    " Wagner Igarashi para impedir o colapso do semestre universitário.",
  )
  io.println(
    " O Moodle foi invadido e sua missão é explorar as vulnerabilidades",
  )
  io.println(" deixadas pelo hacker que corrompeu o sistema.")
  io.println(
    "________________________________________________________________________\n",
  )

  io.println("Entrar no Moodle? [ENTER PARA CONTINUAR]")
  case question("") {
    _ -> entra_moodle()
  }
}

/// Exibe a página inicial do Moodle que foi corrompido
/// E inicia a navegação para a área de Disciplinas
pub fn entra_moodle() {
  io.println(
    "\n========================================================================",
  )
  io.println("                             Moodle UEM")
  io.println(
    "________________________________________________________________________",
  )
  io.println("")
  io.println("                                                .-.  ")
  io.println("                                               (o.o)   ")
  io.println("        - Bxxg Mxoodxxx                         |=|    ")
  io.println("                                               __|__  ")
  io.println("                                             //.=|=.\\ ")
  io.println("        - Fxxrum                            // .=|=. \\")
  io.println("                                            \\  .=|=. //")
  io.println("                                             \\ (_=_)// ")
  io.println("        - Disciplinas                         (:| |:)  ")
  io.println("                                               || || ")
  io.println("                                               () ()  ")
  io.println("        - Acxsxxs Atxais                       || || ")
  io.println("                                               || || ")
  io.println("                                              ==' '==  ")
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("*...*")
  io.println("*Realmente a página do Moodle está corrompida.*")
  io.println(
    "*A área de Disciplinas é a única que se manteve estranhamente intacta*\n*Me pergunto se lá existe alguma pista...*\n",
  )
  io.println("Acessar área de Disciplinas [ENTER PARA CONTINUAR]")
  case question("") {
    _ -> area_disciplinas()
  }
}

/// Exibe a lista de disciplinas disponíveis
/// E permite ao jogador escolher uma disciplina para explorar
/// Cada disciplina tem um enigma que deve ser resolvido para obter pistas
pub fn area_disciplinas() {
  io.println(
    "\n========================================================================",
  )
  io.println("\nDisciplinas Disponíveis:")
  io.println("1. Banco de Dados I")
  io.println("2. Análise de Sistemas")
  io.println("3. Arquitetura e Organização de Computadores II")
  io.println("4. Programação Funcional")
}

/// Permite ao jogador escolher uma disciplina para entrar
pub fn entrar_no_ambiente(escolha: Int) -> Ambiente {
  case escolha {
    1 -> ambiente_bd()
    2 -> ambiente_ass()
    3 -> ambiente_arq()
    4 -> ambiente_pf()
    _ -> ambiente_disciplina()
  }
}

/// Cria o ambiente principal, a qual estão todas as disciplinas
pub fn ambiente_disciplina() -> Ambiente {
  ambiente.novo_ambiente(
    "Disciplinas Disponíveis",
    "Estranhamente, esta área é a única do Moodle que se mantém funcional.\nPossui as quatro disciplinas e um terminal.",
    [],
    [
      "Banco de Dados",
      "Análise de Sistemas",
      "Arquitetura de Computadores",
      "Programação Funcional",
      "Terminal ADM (Fase2)",
    ],
    [enigma_ip_final()],
  )
}

/// Cria o enigma final da frase, é preciso que o jogador tenha reunido as pistas
/// das outras salas
pub fn enigma_ip_final() -> Enigma {
  enigma.novo_enigma(
    "O terminal aguarda o IP completo.\nQual é o IP? (Formato: xxx.xxx.x.x)",
    "192.168.0.7",
    ["Procure nas outras disciplinas", "Começa com 192..."],
    liberar_fase2,
  )
}

///Constrói o ambiente(página) da disciplina de Análise de Sistemas
pub fn ambiente_ass() -> Ambiente {
  let nome = "Disciplina de Análise de Sistemas"
  let descricao =
    "Você vê o Console de Auditoria do Firewall.\nO registro de eventos críticos foi quase totalmente apagado,\nmas uma falha de autenticação de alto risco resistiu à exclusão.\nO sistema reporta uma tentativa de ataque originada de um endereço interno."
  ambiente.novo_ambiente(nome, descricao, [], ["Voltar"], [enigma_ass()])
}

///Cria o enigma que contém a primeira parte do IP (192)
pub fn enigma_ass() -> Enigma {
  enigma.novo_enigma(
    "[08:45:12] ERROR_ACCESS_DENIED\n"
      <> "    SOURCE_IP: [192].xxx.xx.xx\n"
      <> "    TARGET_SERVICE: MOODLE_AUTH\n"
      <> "    SEVERITY: HIGH\n"
      <> "    ACTION: REJECTED PORT SCAN",
    "192",
    ["*Esse número me parece suspeito...*"],
    adquire_objeto_ass,
  )
}

/// Ao resolver o enigma de ASS, adiciona a anotação 192 ao inventário do jogador
pub fn adquire_objeto_ass(j: Jogador) -> Jogador {
  io.println("\nNúmero suspeito [192] foi obtido!")
  jogador.adiciona_item(j, "Número suspeito 192")
}

///Constrói o ambiente(página) da disciplina de Banco de Dados I
pub fn ambiente_bd() -> Ambiente {
  let nome = "Disciplina de Banco de Dados"
  let descricao =
    "Você encontra um terminal SQL que está travado (STUCK).\nO parser rejeitou o comando final, mas a query incompleta ficou em buffer,\nrevelando a tentativa do invasor de listar dados de usuários e,\ncrucialmente, o endereço de host do servidor.\nO hacker tentou uma injeção SQL, mas falhou em fechar a string\nexpondo metadados sensíveis."
  ambiente.novo_ambiente(nome, descricao, [], ["Voltar"], [enigma_bd()])
}

/// Cria o enigma que contém a segunda parte do IP (168)
pub fn enigma_bd() -> Enigma {
  enigma.novo_enigma(
    "ERROR: Syntax error at or near 'host_address'\n"
      <> "LINE 1: SELECT user_data, password_hash\n"
      <> "FROM moodle_users\n"
      <> "WHERE status = 'active'\n"
      <> "AND host_address = '[168].x.x'\n",
    "168",
    ["Parece que tentaram fazer uma injeção de SQL. E por que esse número?..."],
    adquire_objeto_bd,
  )
}

/// Ao resolver o enigma de BD, adiciona a anotação 168 ao inventário do jogador
fn adquire_objeto_bd(j: Jogador) -> Jogador {
  io.println("\nNúmero suspeito [168] foi obtido!")
  jogador.adiciona_item(j, "Número suspeito 168")
}

///Constrói o ambiente(página) da disciplina de Arquitetura e 
///Organização de Computadores II
pub fn ambiente_arq() -> Ambiente {
  let nome = "Disciplina de Arquitetura de Computadores"
  let descricao =
    "Você encontra um Terminal de Assembly (MIPS) ativo,\nmas travado em uma rotina de inicialização crucial do sistema,\ncontribuindo para o colapso do Moodle.\nO hacker injetou um código de negação de serviço (DoS) de baixo nível\nque força o processador a ficar preso em um loop infinito e inútil"
  ambiente.novo_ambiente(nome, descricao, [], ["Voltar"], [enigma_arq()])
}

/// Cria o enigma que contém a terceira parte do IP (0)
pub fn enigma_arq() -> Enigma {
  enigma.novo_enigma(
    ">> Iniciando Depuração Remota (MIPS/32-bit)...\n"
      <> "[DEBUGGER] Estado da CPU: HALTED no endereço 0x10000000\n"
      <> "[DEBUGGER] Registrador R1 não inicializado: Valor Desconhecido (???)\n"
      <> "[CÓDIGO ASSEMBLY]\n"
      <> "0x10000000: XOR R1, R1, R1\n"
      <> "0x10000004: JUMP 0x10000000\n"
      <> "...\n"
      <> ">> Executando a instrução XOR...\n"
      <> ">> A operação (R1 XOR R1) está concluída.\n"
      <> "[STATUS DO REGISTRADOR]\n"
      <> "Nome: R1 (Registrador Temporário 1)\n"
      <> "Valor Final: [0]\n"
      <> "Propósito: Pista de Sub-Rede\n",
    "0",
    [
      "Além de ter travado o programa com um loop, o hacker limpou o registrador R1.\nPor que ele o fez e deixou o valor tão aparente?..",
    ],
    adquire_objeto_arq,
  )
}

/// Ao resolver o enigma de ARQ , adiciona a anotação 0 ao inventário do jogador
pub fn adquire_objeto_arq(j: Jogador) -> Jogador {
  io.println("Número suspeito [0] foi obtido!")
  jogador.adiciona_item(j, "Número suspeito 0")
}

/// Constrói o ambiente(página) da disciplina de Programação Funcional
pub fn ambiente_pf() -> Ambiente {
  let nome = "Disciplina de Programação Funcional"
  let descricao =
    "Você vê um Terminal Interativo (gleam REPL)!\nO hacker manipulou uma função de inicialização crítica,\nforçando-a a se tornar uma constante,\no que causa erros de consistência no kernel do Moodle."
  ambiente.novo_ambiente(nome, descricao, [], ["Voltar"], [enigma_pf()])
}

/// Cria o enigma que contém a quarta parte do IP (7)
pub fn enigma_pf() -> Enigma {
  enigma.novo_enigma(
    "fn calc_final_byte(n: Int) -> Int {\n"
      <> "  case n {\n"
      <> "    0 -> 7\n"
      <> "    _ -> 7\n"
      <> "  }\n"
      <> "}\n",
    "7",
    ["Curioso...O que acontece quando a saída só depende de uma constante?"],
    adquire_objeto_pf,
  )
}

/// Ao resolver o enigma de PF, adiciona a anotação 7 ao inventário do jogador
pub fn adquire_objeto_pf(j: Jogador) -> Jogador {
  io.println("Número suspeito [7] foi obtido!")
  jogador.adiciona_item(j, "Número suspeito 7")
}

/// Libera a fase 2 do jogo, onde o jogador vai poder acessar o terminal do administrador
fn liberar_fase2(j: Jogador) -> Jogador {
  io.println(
    "________________________________________________________________________\n",
  )
  io.println(">> [SISTEMA] IP 192.168.0.1 localizado.")
  io.println(">> [HACK] Iniciando varredura de portas no alvo...")
  io.println(">> [ALERTA] Porta 22 (SSH) está ABERTA e VULNERÁVEL.")
  io.println(">> [AUTO] Injetando exploit de conexão remota...")
  io.println(">> ...")
  io.println(">> ...")
  io.println(">> CONEXÃO SSH ESTABELECIDA.")

  jogador.adiciona_item(j, "Conexao_SSH_Ativa")
}
