//
//  ListFilmsTableViewCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit
import RxSwift

protocol ListFilmsTableViewCellProtocol {
    func reloadData(_ model:MovieModel)
}

class ListFilmsTableViewCell: UITableViewCell {
    
    private var delegate:ListFilmsTableViewCellProtocol?
    
    private let disposeBag = DisposeBag()
    
    public func delegate(delegate:ListFilmsTableViewCellProtocol) {
        self.delegate = delegate
    }
    
    static let identifier = "ListFilmsTableViewCell"
    
    private var viewModel:FilmsViewModelCell?
    
    private var like:Bool = false
    
    lazy var listFilmsCellView:ListFilmsCellView = {
        let view = ListFilmsCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsCellView, isEqualTo: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCells(model:MovieModel){
        self.viewModel = FilmsViewModelCell(model: model)
        DispatchQueue.global().async {
            guard let imageFilm = self.viewModel?.getBackDropPath() else {return}
            DispatchQueue.main.async {
                self.listFilmsCellView.filmImageView.image = UIImage(data: imageFilm)
                self.listFilmsCellView.titleFilmLabel.text = self.viewModel?.getFilmTitle
                self.listFilmsCellView.dateFilmLabel.text = self.viewModel?.getDateFilm
                self.listFilmsCellView.likeButton.setImage(self.listFilmsCellView.imageLikeButton.image?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            }
        }
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.listFilmsCellView)
    }
}
