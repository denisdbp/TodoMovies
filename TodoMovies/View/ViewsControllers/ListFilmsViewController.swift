//
//  ViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsViewController: UIViewController {
    
    //MARK: Variaveis
    lazy var listFilmsView:ListFilmsView = {
        let view = ListFilmsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel:FilmsViewModel?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms, movieId: 0)
        self.configBindings()
    }
    
    override func loadView() {
        super.loadView()
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsView, isEqualTo: self.view)
    }
    
    //MARK: Funções
    // Configuração de todos os Bindings ou seja o que esta sendo obersavado na ViewModel esta sendo enviado aqui
    // para poder ligar o que recebeu com a UI
    private func configBindings(){
        guard let disposeBag = self.viewModel?.disposeBag else {return}
        
        self.viewModel?.loading.subscribe(onNext: { [weak self] loading in
            guard let self = self else {return}
            if loading == false {
                self.listFilmsView.loadingIndicator.stopAnimating()
            }
        }).disposed(by: disposeBag)
        
        self.viewModel?.error.subscribe(onNext: { [weak self] _ in
            guard let self = self else {return}
            self.listFilmsView.loadingIndicator.stopAnimating()
            Alerts.shared.alertError(title: "Ops..", message: "Houve um erro na requsição", viewController: self)
        }).disposed(by: disposeBag)
        
        self.listFilmsView.listFilmsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        self.viewModel?.model.bind(to: self.listFilmsView.listFilmsTableView.rx.items(cellIdentifier: ListFilmsTableViewCell.identifier, cellType: ListFilmsTableViewCell.self)){ (row, model, cell) in
            cell.configCells(model: model)
        }.disposed(by: disposeBag)
        
        self.listFilmsView.listFilmsTableView.rx.modelSelected(MovieModel.self).subscribe { [weak self] model in
            guard let self = self else {return}
            let detailsFilmViewController:DetailsFilmViewController = DetailsFilmViewController()
            detailsFilmViewController.movieId = model.element?.id ?? 0
            self.navigationController?.pushViewController(detailsFilmViewController, animated: true)
        }.disposed(by: disposeBag)
    }
    
    private func addSubViews(){
        self.view.addSubview(self.listFilmsView)
    }
}

//MARK: Extensions
extension ListFilmsViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
