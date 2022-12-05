//
//  ListFilmsCoordinator.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation
import UIKit

class ListFilmsCoordinator:Coordinator {
    var navigationController: UINavigationController
    let listFilmsViewController:ListFilmsViewController = ListFilmsViewController()
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.pushViewController(self.listFilmsViewController, animated: true)
    }
    
    func popToRootViewController() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
