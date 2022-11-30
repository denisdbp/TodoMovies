//
//  DetailsFilmViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class DetailsFilmViewController: UIViewController {
    
    //MARK: Variaveis
    lazy var detailsFilmView:DetailsFilmView = {
        let view = DetailsFilmView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Essa variavel é carregada quando seleciono um filme da tela principal, pois assim quando passar para essa tela
    // ela requisite os detalhes do filme
    public var movieId:Int = 0
    private var viewModel:FilmsViewModel?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .detailFilms, movieId: self.movieId)
        self.loadingDetailsFilm()
        self.returnButton()
    }
    
    override func loadView() {
        super.loadView()
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.detailsFilmView, isEqualTo: self.view)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    //MARK: Funções
    // Função que carrega os detalhes do filme que estão vindo do objeto observado detailsMovieModel
    // que recebe os dados populados da model
    private func loadingDetailsFilm(){
        guard let disposeBag = self.viewModel?.disposeBag else {return}
        
        self.viewModel?.error.subscribe(onNext: { [weak self] _ in
            guard let self = self else {return}
            Alerts.shared.alertError(title: "Ops..", message: "Houve um erro na requsição", viewController: self)
        }).disposed(by: disposeBag)
        
        self.viewModel?.detailsMovieModel.subscribe(onNext: { [weak self] detailsModel in
            guard let self = self else {return}
            self.detailsFilmView.titleFilmLabel.text = detailsModel[0].original_title
            self.detailsFilmView.voteCountLabel.text = self.viewModel?.configNumberVoteCount(voteCount: detailsModel[0].vote_count)
            self.detailsFilmView.popularityViewsLabel.text = self.viewModel?.configNumberPopularityViews(popularityViews: detailsModel[0].popularity)
            DispatchQueue.global().async {
                guard let image = self.viewModel?.getImageDetailsFilm(urlImage: detailsModel[0].backdrop_path) else {return}
                DispatchQueue.main.async {
                    self.detailsFilmView.filmImageView.image = UIImage(data: image)
                }
            }
            self.detailsFilmView.overviewFilmLabel.text = detailsModel[0].overview
        }).disposed(by: disposeBag)
    }
    
    // Aqui retorna para a tela principal do App
    private func returnButton(){
        guard let disposeBag = self.viewModel?.disposeBag else {return}
        self.detailsFilmView.returnButton.rx.tap.subscribe { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }.disposed(by: disposeBag)
    }
    
    private func addSubViews(){
        self.view.addSubview(self.detailsFilmView)
    }
}
