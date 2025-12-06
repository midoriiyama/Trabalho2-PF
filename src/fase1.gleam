import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}

pub fn contexto_f1() {
  io.println(
    "Você é aluno de Ciência da Computação da UEM, convocado pelo professor Wagner Igarashi a impedir o colapso
    do semestre universitário. O Moodle foi invadido e sua missão é explorar as vulnerabilidades deixadas pelo hacker que
    corrompeu o sistema.",
  )
  io.println("\nENTRAR NO MOODLE HACKEADO [ENTER]")
  io.println(" Moodle UEM")
  io.println("     .-.  ")
  io.println("    (o.o)   ")
  io.println("     |=|    ")
  io.println("    __|__  ")
  io.println("  //.=|=.\\ ")
  io.println(" // .=|=. \\")
  io.println(" \\ .=|=. //")
  io.println("  \\(_=_)// ")
  io.println("   (:| |:)  ")
  io.println("    || || ")
  io.println("    () ()  ")
  io.println("    || || ")
  io.println("    || || ")
  io.println("   ==' '==  ")
  io.println("\n*...*")
  io.println("*Realmente a página do Moodle está corrompida.*")
  io.println(
    "*A área de Disciplinas é a única que se manteve estranhamente intacta,
    me pergunto se lá existe alguma pista*\n",
  )
  //entra na pag de disciplinas
  area_disciplinas()
}

pub fn entrar_no_ambiente(escolha: Int) -> Ambiente {
  case escolha {
    1 -> ambiente_ass()
    2 -> ambiente_bd()
    3 -> ambiente_arq()
    4 -> ambiente_pf()
    _ -> ambiente_disciplina()
  }
}

pub fn area_disciplinas() {
  io.println("┌── 0. Disciplinas Disponíveis")
  io.println("│   ├── 1. Análise de Sistemas")
  io.println("│   ├── 2. Banco de Dados I")
  io.println("│   ├── 3. Arquitetura e Organização de Computadores II")
  io.println("│   └── 4. Programação funcional")
  io.println("Digite o número correspondente para acesso: ")
}

pub fn ambiente_disciplina() -> Ambiente {
  let sala = "Disciplinas Disponíveis"
  ambiente.novo_ambiente(
    sala,
    "",
    [],
    ["Análise", "Banco de Dados", "Arquitetura", "Funcional"],
    [],
  )
}

///Página ASS
pub fn ambiente_ass() -> Ambiente {
  let nome = "Disciplina de Análise de Sistemas"
  let descricao =
    "*As entregas dos trabalhos estão aqui, mas não consigo acessá-los...*"
  ambiente.novo_ambiente(
    nome,
    descricao,
    [objeto_ass()],
    ["Área Disciplinas"],
    [],
  )
}

pub fn objeto_ass() -> Objeto {
  objeto.novo_objeto("Log de acesso", "ERROR IP: [192]...", fn(j) {
    io.println(">> Você anotou: Parte 1 = 192")
    jogador.adiciona_item(j, "Nota_Parte_192")
  })
}

///Página BD
pub fn ambiente_bd() -> Ambiente {
  let nome = "Disciplina de Banco de Dados I"
  let descricao = "*SQL é bom demaiss*"
  ambiente.novo_ambiente(
    nome,
    descricao,
    [objeto_bd()],
    ["Área Disciplinas"],
    [],
  )
}

fn objeto_bd() -> Objeto {
  objeto.novo_objeto("Query SQL Corrompida", "...conectado em [.168]...", fn(j) {
    io.println(">> Você anotou ,.: Parte 2 = .168")
    jogador.adiciona_item(j, "Nota_Parte_168")
  })
}

///Página ARQ
pub fn ambiente_arq() -> Ambiente {
  let nome = "Disciplina de Arquitetura e Organização de computadores II"
  let descricao = "*Saudades Pipeline... *"
  ambiente.novo_ambiente(
    nome,
    descricao,
    [objeto_arq()],
    ["Área Disciplinas"],
    [],
  )
}

fn objeto_arq() -> Objeto {
  objeto.novo_objeto(
    "Terminal de Assembly (MIPS)",
    "Uma janela de simulação está aberta. O código parou na linha: 'XOR R1, R1'.",
    fn(j) {
      io.println(">> Você analisa o ciclo de clock da CPU virtual.")
      io.println(
        ">> A instrução XOR de um número por ele mesmo sempre resulta em zero.",
      )
      io.println(">> O valor no Registrador R1 é: [0].")
      io.println(">> Você anotou: Parte 3 = .0")

      jogador.adiciona_item(j, "Nota_Parte_0")
    },
  )
}

///Página PF
pub fn ambiente_pf() -> Ambiente {
  let nome = "Disciplina de Programação Funcional"
  let descricao =
    "*Que curioso, consigo acessar o ambiente interativo de gleam...*\n*Como assim ele pede um IP completo para restaurar o sistema?*"
  ambiente.novo_ambiente(nome, descricao, [], ["Área Disciplinas"], [
    enigma_ip_final(),
  ])
}

fn enigma_ip_final() -> Enigma {
  enigma.novo_enigma(
    "O terminal aguarda o IP completo. Junte as pistas das outras salas.\nQual é o IP? (Formato: xxx.xxx.x.x)",
    "192.168.0.1",
    ["Procure nas outras matérias", "Começa com 192..."],
    liberar_fase2,
  )
}

fn liberar_fase2(j: Jogador) -> Jogador {
  io.println("\n>> [SISTEMA] IP 192.168.0.1 localizado.")
  io.println(">> [HACK] Iniciando varredura de portas no alvo...")
  io.println(">> [ALERTA] Porta 22 (SSH) está ABERTA e VULNERÁVEL.")
  io.println(">> [AUTO] Injetando exploit de conexão remota...")
  io.println(">> ...")
  io.println(">> ...")
  io.println(">> CONEXÃO ESTABELECIDA.")

  jogador.adiciona_item(j, "Conexao_SSH_Ativa")
}
