//
//  ListFilmsView.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsView: UIView {
    
    lazy var loadingIndicator:UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.color = .white
        loading.startAnimating()
        return loading
    }()
    
    lazy var listFilmsTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = CustomColors.colorBlack
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ListFilmsTableViewCell.self, forCellReuseIdentifier: ListFilmsTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsTableView, isEqualTo: self)
        self.configConstraintLoadingIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewDelegate(delegate:UITableViewDelegate){
        self.listFilmsTableView.delegate = delegate
    }
    
    private func addSubViews(){
        self.addSubview(self.listFilmsTableView)
        self.addSubview(self.loadingIndicator)
    }
    
    private func configConstraintLoadingIndicator(){
            NSLayoutConstraint.activate([
                self.loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        }
}
