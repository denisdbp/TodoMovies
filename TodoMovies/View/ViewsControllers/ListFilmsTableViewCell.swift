//
//  ListFilmsTableViewCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsTableViewCell: UITableViewCell {

    static let identifier = "ListFilmsTableViewCell"
    
    private var viewModel:FilmsViewModelCell?
    
    lazy var filmImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = false
        return image
    }()
    
    lazy var titleFilmLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var likeButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(self.imageLikeButton.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    lazy var imageLikeButton:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "heart")
        image.backgroundColor = .white
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        self.configConstraintsFilmImageView()
        self.configConstraintTitleFilmView()
        self.configConstraintLikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCells(model:MovieModel){
        self.viewModel = FilmsViewModelCell(model: model)
        DispatchQueue.global().async {
            guard let imageFilm = self.viewModel?.getBackDropPath() else {return}
            DispatchQueue.main.async {
                self.filmImageView.image = UIImage(data: imageFilm)
                self.titleFilmLabel.text = self.viewModel?.getFilmTitle
            }
        }
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.filmImageView)
        self.contentView.addSubview(self.titleFilmLabel)
        self.contentView.addSubview(self.likeButton)
    }
    
    private func configConstraintsFilmImageView(){
        NSLayoutConstraint.activate([
            self.filmImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.filmImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.filmImageView.widthAnchor.constraint(equalToConstant: 80),
            self.filmImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configConstraintTitleFilmView(){
        NSLayoutConstraint.activate([
            self.titleFilmLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.titleFilmLabel.leadingAnchor.constraint(equalTo: self.filmImageView.trailingAnchor, constant: 10)
        ])
    }
    
    private func configConstraintLikeButton(){
        NSLayoutConstraint.activate([
            self.likeButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.likeButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.likeButton.widthAnchor.constraint(equalToConstant: 30),
            self.likeButton.heightAnchor.constraint(equalToConstant: 30),
            self.imageLikeButton.widthAnchor.constraint(equalToConstant: 30),
            self.imageLikeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
