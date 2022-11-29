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
    
    private let viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listFilmsView.configTableViewDelegate(delegate: self)
        self.configBindings()
    }
    
    private func configBindings(){
        self.viewModel.model.bind(to: self.listFilmsView.listFilmsTableView.rx.items(cellIdentifier: ListFilmsTableViewCell.identifier, cellType: ListFilmsTableViewCell.self)){ (row, model, cell) in
            cell.configCells(model: model)
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

