//
//  TodoMoviesUITests.swift
//  TodoMoviesUITests
//
//  Created by Admin on 30/11/22.
//

import XCTest

class TodoMoviesUITests: XCTestCase {

    //Função para testar a UI
    func testUiFilms() throws {
        let app = XCUIApplication()
        app.launch()

        // Aqui verifico se a tableView que tem na tela de lista de filmes ela existe e dou um Tap nela para passar para a próxima tela
        let listaDeFilmes = app.tables["listaDeFilmes"]
        XCTAssertTrue(listaDeFilmes.exists)
        listaDeFilmes.tap()
        
        // Aqui somente verifico se existem os elementos que tem na tela de detalhe do filme
        let imageDoFilmeDetalhe = app.images["imagemDoFilme"]
        XCTAssertTrue(imageDoFilmeDetalhe.exists)
        
        let titulodoFilmeDetalhe = app.staticTexts["tituloDoFilme"]
        XCTAssertTrue(titulodoFilmeDetalhe.exists)
        
        let likesDoFilmeDetalhe = app.staticTexts["likesDoFilme"]
        XCTAssertTrue(likesDoFilmeDetalhe.exists)
        
        let viewDoFilmeDetalhe = app.staticTexts["viewsDoFilme"]
        XCTAssertTrue(viewDoFilmeDetalhe.exists)
        
        let scrollDescricaoFilme = app.scrollViews["scrollDescricaoFilme"]
        XCTAssertTrue(scrollDescricaoFilme.exists)
        
        let viewDaScroll = scrollDescricaoFilme.firstMatch
        XCTAssertTrue(viewDaScroll.exists)
        
        let descricaoDoFilmeDetalhe = viewDaScroll.firstMatch
        XCTAssertTrue(descricaoDoFilmeDetalhe.exists)
    }
}
