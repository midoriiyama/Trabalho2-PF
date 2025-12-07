import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}

@external(javascript, "../../../../readline_bridge.mjs", "write_file")
fn write_file(path: String, content: String) -> Bool

@external(javascript, "../../../../readline_bridge.mjs", "question")
pub fn question(prompt: String) -> String

/// Ponto de entrada da Fase 2
/// Exibe a narrativa inicial da fase e a inicia
pub fn contexto_f2() {
  io.println(
    "\n\n\n========================================================================\n",
  )
  io.println(
    "*Acho que entrei na máquina do administrador do Moodle*\n*Pelo visto existe uma falha na Porta 22...*",
  )

  io.println("                          ___________     ")
  io.println("                         |.---------.|    ")
  io.println("                         ||         || ")
  io.println("                         ||         || ")
  io.println("                         ||         || ")
  io.println("                         |'---------'| ")
  io.println("                          `)__ ____('  ")
  io.println("                          [=== -- o ]  ")
  io.println("                        __'---------'__ ")
  io.println("                       [::::::::::: :::] ")
  io.println("                       '---------------'")
  io.println("")
  io.println(
    "*Tenho acesso aos e-mails do administrador*\n*Me pergunto se vou encontrar algo de útil...*",
  )
  io.println(
    "________________________________________________________________________\n",
  )
  io.println("Baixar os e-mails do administrador [ENTER PARA CONTINUAR]")

  case question("") {
    _ -> baixar_emails()
  }
}

/// Simula o download dos e-mails do administrador, 
/// salvando-os em arquivos locais
fn baixar_emails() {
  io.println("Baixando caixa de entrada do Admin para seu diretório local...")

  let email1 =
    "
  DE: Clinica VetCare <contato@vetcare.com>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: Lembrete de Vacina

  Olá!
  
  Gostaríamos de lembrar que o seu pet, Jujuba, está com a vacina anual vencida.
  Por favor, agende uma consulta conosco para garantir a saúde e o bem-estar do seu amigo peludo.
  
  Atenciosamente,
  Equipe VetCare.
  "
  let _ = write_file("fase2_email_veterinario.txt", email1)

  let email2 =
    "
  DE: Suporte Moodle <support-noreply@fake-moodle.com>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: ALERTA: SUA SENHA EXPIROU

  ATENÇÃO USUÁRIO.
  Sua conta será deletada em 24 horas.
  Responda com sua senha para cancelar.
  "
  let _ = write_file("fase2_email_spam.txt", email2)

  let email3 =
    "
  DE: SysAdmin Automático <no-reply@uem.br>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: LOG DE ROTAÇÃO DE CREDENCIAIS

  [ALERTA DE SEGURANÇA]
  Sua senha foi resetada administrativamente.
  
  HASH ATUAL: QBQBIH
  
  Nota: O sistema não aceita caracteres especiais.
  "
  let _ = write_file("fase2_email_seguranca.txt", email3)

  let email4 =
    "
  DE: Gestão de Copa <copageral@uem.br>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: LIMPEZA DA GELADEIRA (AVISO FINAL)

  Prezados,

  Quem deixou o Tupperware com lasanha mofada na geladeira tem até as 7h para retirar.
  Caso contrário, o pote será jogado no lixo junto com a comida.
  
  Grato pela compreensão.
  "
  let _ = write_file("fase2_email_aviso_copa.txt", email4)

  let email5 =
    "
  DE: Recursos Humanos UEM <rh@uem.br>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: Aniversariantes do Mês & Festa Julina

  Olá Colaboradores!

  Lembramos que nesta sexta-feira teremos bolo na copa.
  Não esqueçam de contribuir com a caixinha do café.
  
  Att,
  Dona Neide.
  "
  let _ = write_file("fase2_email_rh.txt", email5)

  let email6 =
    "
  DE: Daniella Midori <daniella.midori@moodle.uem.br>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: Re: Re: Novo Protocolo de Segurança
  DATA: Ontem, 3:45

  Daniella (Dev) escreveu:
  |
  | Você tá brincando né? Rotação alfabética? 
  | Isso é literalmente a coisa mais maluca que eu já ouvi
  | Sabe o melhor? Eu aposto que sei qual o número que você usou como chaveKKKKKKKKK
  |
  | Boa sorte com seu império, Julius 
  | Abraço.

      Akemi (Admin) escreveu:
      |
      | Pois é, Dani. Não tenho culpa
      | A ordem veio direto da diretoria: 'Implementar rotação alfabética simples'
      |
      | O script pega a senha e avança uma quantidade de letras por um número chave que defini
      | É ridículo, eu sei. Mas é o que temos pra hoje

          Daniella (Dev) escreveu:
          |
          | Akemi,
          |
          | Vi o memo sobre a atualização de segurança no servidor
          | O que é esse 'Protocolo Romano' que vocês ativaram nos logs?
          | Isso vai quebrar minha integração com o banco?
  "
  let _ = write_file("fase2_thread_email.txt", email6)

  let email7 =
    "
  DE: Prince Nnamdi <prince@bank.ng>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: URGENTE $$

  Ola meu amigo, tenho uma herança de 7 milhoes presa na alfandega.
  Preciso apenas dos seus dados bancarios para liberar a fortuna.
  Clique aqui: [LINK SUSPEITO]
  "
  let _ = write_file("fase2_email_spam.txt", email7)

  let email8 =
    "
  DE: LinkedIn Notifications <noreply@linkedin.com>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: 7 pessoas viram seu perfil

  Olá Akemi07,
  
  Você está popular! 
  Um recrutador da 'Empresa X' e outras 7 pessoas visualizaram seu perfil.
  
  Deseja ver quem são? Assine o Premium agora.
  "
  let _ = write_file("fase2_email_social.txt", email8)

  io.println("\n✅ DOWNLOAD CONCLUÍDO!")
}

/// Cria o objeto presente no ambiente da Fase 2
/// que fornece uma dica para o jogador
fn obj_dica() -> Objeto {
  objeto.novo_objeto(
    "Arquivo READ-ME.txt",
    "*Parece que alguém passou por aqui e não conseguiu resolver...*",
    fn(j) {
      io.println(">> Eu não consegui descobrir a senha.")
      io.println(">> Apesar disso, a thread de e-mails me parece suspeita...")
      j
    },
  )
}

/// Quando o enigma é resolvido, libera o acesso à Fase 3
/// e adiciona o item "Credencial_Root_SQL" ao inventário do jogador
fn liberar_fase3(j: Jogador) -> Jogador {
  io.println(
    "________________________________________________________________________\n",
  )
  io.println(">> [ROOT] Hash 'QBQBIH' revertido para 'JUJUBA'.")
  io.println(">> Acesso ROOT concedido.")
  jogador.adiciona_item(j, "Credencial_Root_SQL")
}

/// Cria o enigma presente no ambiente da Fase 2
fn enigma_sudo() -> Enigma {
  enigma.novo_enigma(
    "Digite a senha de ROOT decifrada:",
    "JUJUBA",
    ["O log mostra QBQBIH", "Volte 7 casas"],
    liberar_fase3,
  )
}

/// Cria o ambiente da Fase 2
pub fn ambiente_adm() -> Ambiente {
  ambiente.novo_ambiente(
    "Terminal Remoto",
    "O terminal exibe um *prompt* simples, confirmando que a conexão SSH\nfoi bem-sucedida, mas você está como um **usuário comum** (`$`)\ne não pode fazer nada significativo.\n"
      <> "*Você digita o comando para obter\nprivilégios de super-usuário e o sistema responde exigindo\na senha para liberar o **Acesso ROOT**",
    [obj_dica()],
    ["Banco de Dados (Fase 3)"],
    [enigma_sudo()],
  )
}
