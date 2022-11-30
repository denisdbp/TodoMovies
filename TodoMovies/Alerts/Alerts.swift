//
//  Alerts.swift
//  TodoMovies
//
//  Created by Admin on 30/11/22.
//

import Foundation
import UIKit

// Classe auxiliar para exibir alerts na tela
class Alerts {
    
    // Aqui um Design Pattern Singleton, onde crio uma instancia unica global desta classe
    static let shared:Alerts = Alerts()
    
    // Função para exibir alertas de erros
    func alertError(title:String, message:String, viewController:UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
