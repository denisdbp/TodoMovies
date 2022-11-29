//
//  ViewController.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsViewController: UIViewController {
    
    private let listFilmsView = ListFilmsView()
    private let viewModel = FilmsViewModel(apiFilmsProvider: ApiFilmsProvider(), option: .listFilms)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listFilmsView.configTableViewDelegate(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.listFilmsView
    }
}

extension ListFilmsViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListFilmsTableViewCell.identifier, for: indexPath) as? ListFilmsTableViewCell {
            cell.configCells(model: self.viewModel.getIndexPath(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsFilmViewController:DetailsFilmViewController = DetailsFilmViewController()
        detailsFilmViewController.titleFilm = self.viewModel.model[indexPath.row].original_title
        self.navigationController?.pushViewController(detailsFilmViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

