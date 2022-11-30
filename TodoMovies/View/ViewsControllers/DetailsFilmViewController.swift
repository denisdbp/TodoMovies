//
//  DetailsFilmViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit
import RxSwift

class DetailsFilmViewController: UIViewController {
    
    lazy var detailsFilmView:DetailsFilmView = {
        let view = DetailsFilmView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var movieId:Int = 0
    private var viewModel:FilmsViewModel?
    private let disposeBag = DisposeBag()
    
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
    
    private func addSubViews(){
        self.view.addSubview(self.detailsFilmView)
    }
    
    private func loadingDetailsFilm(){
        self.viewModel?.detailsMovieModel.subscribe(onNext: { [weak self] detailsModel in
            guard let self = self else {return}
            self.detailsFilmView.titleFilmLabel.text = detailsModel[0].original_title
            if detailsModel[0].vote_count < 999 {
                self.detailsFilmView.voteCountLabel.text = "\(String(detailsModel[0].vote_count))K Likes"
            }
            if detailsModel[0].vote_count > 999 && detailsModel[0].vote_count < 999999 {
                self.detailsFilmView.voteCountLabel.text = self.formatNumberToDecimal(value: Double(detailsModel[0].vote_count))
            }
            if detailsModel[0].vote_count > 999999 {
                self.detailsFilmView.voteCountLabel.text = self.formatNumberToDecimal(value: Double(detailsModel[0].vote_count))
            }
            if detailsModel[0].popularity > 999999 {
                let popularityViews = NSString(format: "%.1f", detailsModel[0].popularity)
                self.detailsFilmView.popularityViewsLabel.text = "\(String(popularityViews))M Views"
                
            }else {
                let popularityViews = NSString(format: "%.1f", detailsModel[0].popularity)
                self.detailsFilmView.popularityViewsLabel.text = "\(String(popularityViews))M Views"
            }
            DispatchQueue.global().async {
                guard let image = self.viewModel?.getImageDetailsFilm(urlImage: detailsModel[0].backdrop_path) else {return}
                DispatchQueue.main.async {
                    self.detailsFilmView.filmImageView.image = UIImage(data: image)
                }
            }
            self.detailsFilmView.overviewFilmLabel.text = detailsModel[0].overview
        }).disposed(by: self.disposeBag)
    }
    
    private func returnButton(){
        self.detailsFilmView.returnButton.rx.tap.subscribe { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }.disposed(by: self.disposeBag)
    }
    
    func formatNumberToDecimal(value:Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:value)) ?? "Valor indefinido"
    }
}
