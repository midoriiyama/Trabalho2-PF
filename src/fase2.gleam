import ambiente.{type Ambiente}
import enigma.{type Enigma}
import gleam/io
import jogador.{type Jogador}
import objeto.{type Objeto}
import simplifile

pub fn contexto_f2() {
  io.println(
    "\n================================================================",
  )
  io.println("📂 FASE 2: DIRETÓRIO /HOME/ADMIN")
  io.println("================================================================")
  io.println(
    "*Acho que entrei na máquina do administrador do Moodle. Pelo visto existe uma falha na Porta 22...*",
  )
  io.println(
    "*Será que com esse acesso, eu consigo encontrar pistas sobre o hacker?*",
  )

  // Chama a função que cria os arquivos
  baixar_emails_reais()

  io.println("\n[TERMINAL] root@moodle:~# sudo acessar_banco_dados")
  io.println("[TERMINAL] [sudo] password for admin: ???")

  io.println("*Certo, preciso encontrar alguma pista para virar ROOT*")
  io.println(
    "*Tenho acesso aos e-mails do administrador, me pergunto se vou encontrar algo de útil...*",
  )
  io.println("*Vou baixar os e-mails para dar uma investigada.*")
}

fn baixar_emails_reais() {
  io.println(
    "\n[SISTEMA] 📥 Baixando caixa de entrada do Admin para seu diretório local...",
  )

  let email1 =
    "
  DE: Clinica VetCare <contato@vetcare.com>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: Lembrete de Vacina

  Olá!
  
  Gostaríamos de lembrar que o banho e tosa do seu cachorro, a Jujuba, 
  está agendado para amanhã às 7h. Por favor, não esqueça de levar a carteirinha de vacinação.
  
  Atenciosamente,
  Equipe VetCare.
  "
  let _ = simplifile.write("fase2_email_veterinario.txt", email1)

  let email2 =
    "
  DE: Suporte Moodle <support-noreply@fake-moodle.com>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: ALERTA: SUA SENHA EXPIROU

  ATENÇÃO USUÁRIO.
  Sua conta será deletada em 24 horas.
  Responda com sua senha para cancelar.
  "
  let _ = simplifile.write("fase2_email_spam.txt", email2)

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
  let _ = simplifile.write("fase2_email_seguranca.txt", email3)

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
  let _ = simplifile.write("fase2_email_aviso_copa.txt", email4)

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
  let _ = simplifile.write("fase2_email_rh.txt", email5)

  let email6 =
    "
  DE: Daniella Midori <daniella.midori@moodle.uem.br>
    PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: Re: Re: Novo Protocolo de Segurança
  DATA: Ontem, 3:45

  Daniella (Dev) escreveu:
  |
  | Hahaha, você tá brincando né?
  | Segurança por obscuridade? 'Protocolo Romano'?
  | Isso é literalmente coisa de 2000 anos atrás!
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
          | O que diabos é esse 'Protocolo Romano' que vocês ativaram nos logs?
          | Isso vai quebrar minha integração com o banco?
  "
  let _ = simplifile.write("fase2_thread_email.txt", email6)

  let email7 =
    "
  DE: Prince Nnamdi <prince@bank.ng>
  PARA: Admin <admin7@moodle.uem.br>
  ASSUNTO: URGENTE $$

  Ola meu amigo, tenho uma herança de 7 milhoes presa na alfandega.
  Preciso apenas dos seus dados bancarios para liberar a fortuna.
  Clique aqui: [LINK SUSPEITO]
  "
  let _ = simplifile.write("fase2_email_spam.txt", email7)

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
  let _ = simplifile.write("fase2_email_social.txt", email8)

  io.println("[SISTEMA] ✅ Download concluído!")
  io.println(
    "[SISTEMA] ⚠️  VÁ ATÉ A PASTA DO SEU PROJETO E ABRA OS ARQUIVOS .TXT QUE APARECERAM.",
  )
}

fn obj_readme() -> Objeto {
  objeto.novo_objeto(
    "Arquivo LEIA-ME.txt",
    "Instruções do invasor anterior.",
    fn(j) {
      io.println(">> Conteúdo: 'Eu não consegui quebrar a senha.'")
      io.println(">> 'Leia a thread de e-mails sobre o Protocolo Romano.'")
      j
    },
  )
}

fn liberar_acesso_bd(j: Jogador) -> Jogador {
  io.println("\n>> [ROOT] Hash 'QBQBIH' revertido para 'JUJUBA'.")
  io.println(">> Acesso ROOT concedido.")

  jogador.adiciona_item(j, "Credencial_Root_SQL")
}

fn enigma_sudo() -> Enigma {
  enigma.novo_enigma(
    "Digite a senha de ROOT decifrada:",
    "JUJUBA",
    ["O log mostra QBQBIH", "Volte 7 casas (Admin7)"],
    liberar_acesso_bd,
  )
}

pub fn carregar() -> Ambiente {
  let diretorio =
    ambiente.novo_ambiente(
      "Terminal Remoto",
      "Você vê arquivos de log baixados na sua máquina local.",
      [],
      [],
      [],
    )

  ambiente.Ambiente(
    ..diretorio,
    objetos: [obj_readme()],
    saidas: ["Banco de Dados (Fase 3)"],
    enigmas: [enigma_sudo()],
  )
}
