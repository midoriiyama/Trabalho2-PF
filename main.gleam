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