//
//  TodoMoviesUITests.swift
//  TodoMoviesUITests
//
//  Created by Admin on 30/11/22.
//

import XCTest

class TodoMoviesUITests: XCTestCase {

    func testUiFilms() throws {
        let app = XCUIApplication()
        app.launch()

        let listaDeFilmes = app.tables["listaDeFilmes"]
        XCTAssertTrue(listaDeFilmes.exists)
        listaDeFilmes.tap()
        
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
