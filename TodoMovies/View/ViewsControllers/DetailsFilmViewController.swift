//
//  DetailsFilmViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit
import RxSwift

class DetailsFilmViewController: UIViewController {
    
    private let detailsFilmView:DetailsFilmView = DetailsFilmView()
    public var movieId:Int = 0
    private var viewModel:FilmsViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .detailFilms, movieId: self.movieId)
        self.configView()
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.detailsFilmView
    }
    
    private func configView(){
        self.viewModel?.detailsMovieModel.subscribe(onNext: { [weak self] detailsModel in
            guard let self = self else {return}
            print(detailsModel.count)
            self.detailsFilmView.titleFilmLabel.text = detailsModel[0].original_title
        }).disposed(by: self.disposeBag)
    }
}
