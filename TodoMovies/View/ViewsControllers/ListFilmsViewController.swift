//
//  ViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ListFilmsViewController: UIViewController {
    
    lazy var listFilmsView:ListFilmsView = {
        let view = ListFilmsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel:FilmsViewModel?
    
    //private let viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms, movieId: 0)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms, movieId: 0)
        self.configBindings()
    }
    
    private func configBindings(){
        self.listFilmsView.listFilmsTableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        self.viewModel?.model.bind(to: self.listFilmsView.listFilmsTableView.rx.items(cellIdentifier: ListFilmsTableViewCell.identifier, cellType: ListFilmsTableViewCell.self)){ (row, model, cell) in
            cell.configCells(model: model)
        }.disposed(by: self.disposeBag)
        
        self.listFilmsView.listFilmsTableView.rx.modelSelected(MovieModel.self).subscribe { model in
            let detailsFilmViewController:DetailsFilmViewController = DetailsFilmViewController()
            detailsFilmViewController.movieId = model.element?.id ?? 0
            self.navigationController?.pushViewController(detailsFilmViewController, animated: true)
        }.disposed(by: self.disposeBag)

    }
    
    override func loadView() {
        super.loadView()
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsView, isEqualTo: self.view)
    }
    
    private func addSubViews(){
        self.view.addSubview(self.listFilmsView)
    }
    
}

extension ListFilmsViewController:UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
