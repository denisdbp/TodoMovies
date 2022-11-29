//
//  ListFilmsView.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsView: UIView {
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewDelegate(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.listFilmsTableView.delegate = delegate
        self.listFilmsTableView.dataSource = dataSource
    }
    
    private func addSubViews(){
        self.addSubview(self.listFilmsTableView)
    }
}
