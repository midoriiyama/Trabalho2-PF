import enigma.{type Enigma}
import objeto.{type Objeto}

/// Define um tipo de ambiente no jogo
/// Um ambiente possui nome, descrição, objetos presentes, saídas para outros ambientes e enigmas a serem resolvidos
pub type Ambiente {
  Ambiente(
    nome: String,
    descricao: String,
    objetos: List(Objeto),
    saidas: List(String),
    enigmas: List(Enigma),
  )
}

/// Cria um novo ambiente
pub fn novo_ambiente(
  nome: String,
  descricao: String,
  objetos: List(Objeto),
  saidas: List(String),
  enigmas: List(Enigma),
) -> Ambiente {
  Ambiente(nome, descricao, objetos, saidas, enigmas)
}
