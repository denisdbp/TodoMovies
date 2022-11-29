//
//  DetailsFilmViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class DetailsFilmViewController: UIViewController {
    
    private let detailsFilmView:DetailsFilmView = DetailsFilmView()
    private let viewModel:FilmsViewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .detailFilm)
    
    public var titleFilm:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailsFilmView.titleFilmLabel.text = self.titleFilm

    }
    
    override func loadView() {
        super.loadView()
        self.view = self.detailsFilmView
    }
}
