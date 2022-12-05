//
//  DetailsFilmCoordinator.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation
import UIKit

class DetailsFilmCoordinator:Coordinator {
    var navigationController: UINavigationController
    let detailsFilmViewController:DetailsFilmViewController = DetailsFilmViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.pushViewController(self.detailsFilmViewController, animated: true)
    }
    
    func popToRootViewController(){
        self.navigationController.popToRootViewController(animated: true)
    }
}
