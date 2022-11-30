//
//  ConfigGradient.swift
//  TodoMovies
//
//  Created by Admin on 30/11/22.
//

import Foundation
import UIKit

class ConfigGradient {
    
    // Função para adicionar efeito gradiente a qualquer elemento de UIView
    public static func configBackgroundImage(view:UIView){
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 500, height: 400)
        let startColor = UIColor(red: 30/255, green: 80/255, blue: 79/255, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        layer.colors = [startColor, endColor]
        view.layer.insertSublayer(layer, at: 0)
    }
}
