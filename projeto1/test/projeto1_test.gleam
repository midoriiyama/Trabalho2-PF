import enigma
import fase1
import fase2
import fase3
import fase4
import gleam/list
import gleeunit
import gleeunit/should
import jogador
import jogo
import objeto

pub fn main() {
  gleeunit.main()
}

pub fn jogador_novo_test() {
  let p = jogador.novo_jogador("Hacker", "Inicio")

  // Verifica estado inicial
  p.nome |> should.equal("Hacker")
  p.nivel_alerta |> should.equal(0)
  list.is_empty(p.inventario) |> should.be_true()
}

pub fn jogador_limite_alerta_test() {
  // Testa se o sistema impede que o alerta passe de 100%
  let p = jogador.novo_jogador("Test", "Local")

  // Aumenta em 150 (deveria travar em 100)
  let p_dano = jogador.aumentar_alerta(p, 150)

  p_dano.nivel_alerta |> should.equal(100)
}

pub fn jogador_recursao_inventario_test() {
  // Esse teste prova que sua função recursiva 'possui_item_recursivo' funciona
  let p = jogador.novo_jogador("Test", "Local")
  let p_com_itens =
    p
    |> jogador.adiciona_item("Item A")
    |> jogador.adiciona_item("Item B")
    |> jogador.adiciona_item("Item C")

  // Testa itens existentes
  jogador.tem_item(p_com_itens, "Item A") |> should.be_true()
  jogador.tem_item(p_com_itens, "Item C") |> should.be_true()

  // Testa item inexistente
  jogador.tem_item(p_com_itens, "Item Z") |> should.be_false()
}

pub fn engine_interacao_objeto_test() {
  // Cria um objeto de teste que dá um item específico
  let obj_teste =
    objeto.novo_objeto("Objeto Teste", "Desc", fn(j) {
      jogador.adiciona_item(j, "Item Mágico")
    })

  let player = jogador.novo_jogador("Test", "Sala")

  // Executa a interação usando a engine
  let player_novo = jogo.interagir(obj_teste, player)

  // Verifica se a engine aplicou a mudança
  jogador.tem_item(player_novo, "Item Mágico") |> should.be_true()
}

pub fn engine_resolver_enigma_sucesso_test() {
  // Cria um enigma de teste
  let enigma_teste =
    enigma.novo_enigma("Pergunta", "RESPOSTA", [], fn(j) {
      jogador.adiciona_item(j, "Vitoria")
    })

  let player = jogador.novo_jogador("Test", "Sala")

  // Tenta resolver com a senha CERTA
  let player_ganhador = jogo.resolver_enigma(enigma_teste, "RESPOSTA", player)

  // Deve ter o item
  jogador.tem_item(player_ganhador, "Vitoria") |> should.be_true()
}

pub fn engine_resolver_enigma_falha_test() {
  let enigma_teste =
    enigma.novo_enigma("Pergunta", "RESPOSTA", [], fn(j) {
      jogador.adiciona_item(j, "Vitoria")
    })

  let player = jogador.novo_jogador("Test", "Sala")

  // Tenta resolver com a senha ERRADA
  let player_perdedor = jogo.resolver_enigma(enigma_teste, "errado", player)

  // NÃO deve ter o item
  jogador.tem_item(player_perdedor, "Vitoria") |> should.be_false()
}

pub fn validar_solucao_fase1_test() {
  // Garante que a senha do IP na fase 1 é o IP correto
  let enigma = fase1.enigma_ip_final()
  enigma.solucao |> should.equal("192.168.0.7")
}

pub fn validar_solucao_fase2_test() {
  // Garante que a senha da Fase 2 é JUJUBA
  let ambiente = fase2.ambiente_adm()
  let assert Ok(enigma) = list.first(ambiente.enigmas)

  enigma.solucao |> should.equal("JUJUBA")
}

pub fn validar_solucao_fase3_test() {
  // Garante que a resposta da Fase 3 é recuperar_sistema() 
  let ambiente = fase3.ambiente_cpu()
  let assert Ok(enigma) = list.first(ambiente.enigmas)

  enigma.solucao |> should.equal("recuperar_sistema()")
}

pub fn validar_solucao_fase4_test() {
  // Garante que a resposta da Fase 4 é o comando SQL correto
  let ambiente = fase4.ambiente_servidor_sql()
  let assert Ok(enigma) = list.first(ambiente.enigmas)

  enigma.solucao
  |> should.equal("DELETE FROM processos_ativos WHERE nome = 'Hacker_Moodle'")
}
