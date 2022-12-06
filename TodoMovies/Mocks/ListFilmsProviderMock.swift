//
//  ListFilmsProviderMock.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation

// Classe que criei para fazer um Mock da requisição da API para poder fazer testes unitários
class ListFilmsProviderMock:ListFilmProviderProtocol {
    
    // Função que criar um mock da requisição de lista de filmes
    func listFilms(completion: @escaping (Result<[Movies], Error>) -> Void) {
        let listMovies:Movies = Movies(results: [
            MovieModel(id: 9602,
                       original_title: "Coming to America",
                       overview: "Akeem (Eddie Murphy), o príncipe herdeiro de Zamunda, África, se rebela contra o casamento arranjando por seu pai, o rei Jaffe Joffer (James Earl Jones), que concorda que o filho viaje pelo mundo por 40 dias. Assim, Akeem vai para Nova York, se passando por um pobre estudante para encontrar uma noiva que o ame pelo o que ele é, não por sua posição. Vai trabalhar em uma lanchonete e sente-se atraído por Lisa (Shari Hadley), a filha do seu patrão, Cleo McDowell (John Amos), que é interesseiro e atrapalha o romance, pois quer um bom partido para a filha, sem imaginar quem é na verdade seu funcionário. Akeem viajou com Semmi (Arsenio Hall), seu melhor amigo, que não gosta de se passar por pobre e faz gastos e toma atitudes que podem revelar a identidade de Akeem.",
                       backdrop_path: "/9AdRUGOCia8XUqGFvVaENsSfvrX.jpg",
                       release_date: "1988-06-29",
                       video: false),
            MovieModel(id: 9671, original_title: "Crocodile Dundee",
                       overview: "Michael J. “Crocodilo” Dundee é um criativo australiano que caça crocodilos com as próprias mãos, derruba gigantescos búfalos aquáticos e bebe como ninguém. Mas ele está prestes a enfrentar um tremendo teste de tortura: Uma viagem à Nova Iorque. A bela e persistente repórter Sue Charlton consegue mais que uma simples matéria, quando \"a maravilha australiana\" põe Nova Iorque de pernas para o ar.",
                       backdrop_path: "/8nSB593brq5iI3RTLGnjNqnhK46.jpg",
                       release_date: "1986-09-26",
                       video: false),
            MovieModel(id: 9738,
                       original_title: "Fantastic Four",
                       overview: "O cientista Reed Richards convence seu arrogante colega Victor von Doom a financiar seus experimentos com energia cósmica. Na estação espacial Von Doom, a tripulação, incluindo o astronauta Ben Grimm, a pesquisadora Sue Storm e o piloto Johnny Storm, é exposta a uma tempestade cósmica misteriosa que dá superpoderes a eles. Eles tentam lidar com suas transformações enquanto o detestável von Doom jura vingança.",
                       backdrop_path: "/jkBEPKRq4HWlLwsMFMdDiYwaCle.jpg",
                       release_date: "2005-06-29", video: false)
        ])
        completion(.success([listMovies]))
    }
}
