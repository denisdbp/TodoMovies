//
//  ConfigConstraints.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation
import UIKit

class ConfigConstraints {
    
    static func configConstraintsEqualToView(element:UIView, isEqualTo view: UIView){
        NSLayoutConstraint.activate([
            element.topAnchor.constraint(equalTo: view.topAnchor),
            element.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            element.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            element.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
