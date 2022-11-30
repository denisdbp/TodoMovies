//
//  TodoMoviesTests.swift
//  TodoMoviesTests
//
//  Created by Admin on 30/11/22.
//

import XCTest
@testable import TodoMovies

class TodoMoviesTests: XCTestCase {

    //Variaveis como opcionais
    private var viewModel:FilmsViewModel?
    private var apiFilmsProvider:ApiFilmsProvider?
    
    //Inicializo as variaveis no inicio do meu teste
    override func setUpWithError() throws {
        self.viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms, movieId: 0)
        self.apiFilmsProvider = ApiFilmsProvider()
    }

    //Seto como nil ou seja libero as variaveis no término do meu teste
    override func tearDownWithError() throws {
        self.viewModel = nil
        self.apiFilmsProvider = nil
    }
    
    // Teste para verificar se minha requisicao de lista de filmes esta esperando 20 filmes em sua lista
    // pois a API retorna uma pagina com 20 filmes em JSON
    func testRequestEndPointListFilms(){
        let expectation = XCTestExpectation(description: "Verificando se a API esta requisitando")
        self.apiFilmsProvider?.listFilms(completion: { result in
            switch result {
            case .success(let movies):
                XCTAssertEqual(movies[0].results.count, 20)
            case.failure(let error):
                XCTAssertNil(error, "Erro para requisitar a lista de filmes")
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    // Teste para verificar se minha requisicao de detalhes dos filmes está me retornando 1 filme
    // aqui verifico se o detailsMovie.count esta retornando 1
    // OBS: Aqui no caso eu coloquei um id de filme existente para assim poder testa os detalhes
    func testRequestEndPointDetailsFilms(){
        let expectation = XCTestExpectation(description: "Verificando se a API esta requisitando")
        self.apiFilmsProvider?.detailsFilm(movieId: 4474, completion: { result in
            switch result {
            case .success(let detailsMovies):
                XCTAssertEqual(detailsMovies.count, 1)
            case.failure(let error):
                XCTAssertNil(error, "Erro para requisitar os detalhes dos filmes")
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    // Teste para verificar se a requisição da imagem esta sendo feita corretamente
    // OBS: Aqui coloco uma URL existente de uma imagem do filme
    func testRequestImageFilm(){
        let image = self.viewModel?.getImageDetailsFilm(urlImage: "https://image.tmdb.org/t/p/w500/7PyjcqwobxkoDvy8b9DLblh9mph.jpg")
        XCTAssertNotNil(image)
    }
}
