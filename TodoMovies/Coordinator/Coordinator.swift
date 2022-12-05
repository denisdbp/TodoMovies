//
//  Coordinator.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController:UINavigationController {get set}
    func start()
    func popToRootViewController()
}
