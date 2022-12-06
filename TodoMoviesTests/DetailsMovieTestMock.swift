//
//  DetailsMovieTestMock.swift
//  TodoMoviesTests
//
//  Created by Admin on 06/12/22.
//

import XCTest
@testable import TodoMovies

class DetailsMovieTestMock: XCTestCase {

    //Variaveis como opcionais
    var detailsFilmProviderMock:DetailsFilmProviderMock?
    
    //Inicializo as variaveis no inicio do meu teste
    override func setUpWithError() throws {
        self.detailsFilmProviderMock = DetailsFilmProviderMock()
    }

    //Seto como nil ou seja libero as variaveis no término do meu teste
    override func tearDownWithError() throws {
        self.detailsFilmProviderMock = nil
    }

    // Função que testa através de Mock uma requisição de detalhes do filme
    func testDetailsFilmMock(){
        self.detailsFilmProviderMock?.detailsFilm(movieId: 4474, completion: { result in
            switch result {
            case .success(let detailsMovie):
                XCTAssertEqual(detailsMovie.count, 3)
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
}
