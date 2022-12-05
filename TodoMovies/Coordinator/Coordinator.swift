//
//  Coordinator.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation
import UIKit

// Protocolo Coordinator para fazer a transição de telas
protocol Coordinator {
    var navigationController:UINavigationController {get set}
    func start()
    func popToRootViewController()
}
