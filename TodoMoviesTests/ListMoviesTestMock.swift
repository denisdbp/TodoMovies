//
//  ListMoviesTestMock.swift
//  TodoMoviesTests
//
//  Created by Admin on 06/12/22.
//

import XCTest
@testable import TodoMovies

class ListMoviesTestMock: XCTestCase {

    //Variaveis como opcionais
    var listFilmsProviderMock:ListFilmsProviderMock?
    
    //Inicializo as variaveis no inicio do meu teste
    override func setUpWithError() throws {
        self.listFilmsProviderMock = ListFilmsProviderMock()
    }

    //Seto como nil ou seja libero as variaveis no término do meu teste
    override func tearDownWithError() throws {
        self.listFilmsProviderMock = nil
    }
    
    // Função que testa através de Mock uma requisição de lista de filmes
    func testListFilmsMock(){
        self.listFilmsProviderMock?.listFilms(completion: { result in
            switch result {
            case .success(let listMovies):
                XCTAssertEqual(listMovies[0].results.count, 3)
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
}
