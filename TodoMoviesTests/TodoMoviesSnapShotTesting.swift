//
//  SnapShotTesting.swift
//  TodoMoviesTests
//
//  Created by Admin on 30/11/22.
//

import XCTest
import SnapshotTesting
@testable import TodoMovies

class TodoMoviesSnapShotTesting: XCTestCase {

    // Essa função cria um teste de Snapshot da tela de lista de Filmes
    // Porem não consegui entender como isso funcionaria pois o teste tira um print da tela toda preta
    // Por conta de que a requisição da API ainda carregou a UI
    // Mas deixo aqui para mostrar meu entendimento de teste de Snapshot
    func testUiSnapshot(){
        let listFilmsViewController:ListFilmsViewController = ListFilmsViewController()
        let result = assertSnapshot(matching: listFilmsViewController, as: .image(on: .iPhoneXr))
        XCTAssertNotNil(result)
    }
}
