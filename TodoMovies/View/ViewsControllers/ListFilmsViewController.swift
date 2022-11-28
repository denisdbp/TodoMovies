//
//  ViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsViewController: UIViewController {
    
    private let listFilmsView = ListFilmsView()

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.listFilmsView
    }
}

