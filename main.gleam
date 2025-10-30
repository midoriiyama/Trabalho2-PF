pub type Ambiente {
Ambiente(nome: String, descricao: String, objetos: List(Objeto), saidas: List(String), enigmas: List(Enigma))
}

pub type Objeto {
    Objeto(nome: String, descricao: String, interacao: fn(Jogador) -> Jogador,estado: String)
}

pub type Enigma {
    Enigma(descricao: String, solucao: String, pistas: List(String), efeito: fn(Jogador) -> Jogador)
}

pub type Jogador {
    Jogador(nome: String, inventario: List(String), pontos_de_vida: Int, localizacao: String)
}

pub fn explorar(ambiente: Ambiente, jogador: Jogador) -> String {
    let objetos_txt = list.map(ambiente.objetos, fn(obj) { obj.nome })
    let saidas_txt = list.map(ambiente.saidas, fn(s) { s })
    string.join([ambiente.descricao, "\nObjetos: " <> string.join(objetos_txt, ", "), "\nSaídas: " <> string.join(saidas_txt, ", ")], "\n")
}

pub fn interagir(objeto: Objeto, jogador: Jogador) -> Jogador {
    objeto.interacao(jogador)
}

pub fn resolver_enigma(enigma: Enigma, resposta: String, jogador: Jogador) -> Jogador {
    case resposta == enigma.solucao {
        True -> enigma.efeito(jogador)
        False -> jogador
    }
}