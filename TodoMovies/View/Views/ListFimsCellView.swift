//
//  ListFimsCellView.swift
//  TodoMovies
//
//  Created by Admin on 29/11/22.
//

import UIKit

protocol ListFimsCellViewProtocol {
    func buttonLike()
}

class ListFimsCellView: UIView {
    
    private var delegate:ListFimsCellViewProtocol?
    
    public func delegate(delegate:ListFimsCellViewProtocol){
        self.delegate = delegate
    }
    
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
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var dateFilmLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    lazy var likeButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(self.buttonLike), for: .touchUpInside)
        return button
    }()
    
    lazy var imageLikeButton:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "heart")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        self.configConstraintsFilmImageView()
        self.configConstraintTitleFilmView()
        self.configConstraintDateFilmLabel()
        self.configConstraintLikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonLike(){
        self.delegate?.buttonLike()
    }
    
    private func addSubViews(){
        self.addSubview(self.filmImageView)
        self.addSubview(self.titleFilmLabel)
        self.addSubview(self.likeButton)
        self.addSubview(self.dateFilmLabel)
    }
    
    private func configConstraintsFilmImageView(){
        NSLayoutConstraint.activate([
            self.filmImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.filmImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.filmImageView.widthAnchor.constraint(equalToConstant: 80),
            self.filmImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configConstraintTitleFilmView(){
        NSLayoutConstraint.activate([
            self.titleFilmLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleFilmLabel.leadingAnchor.constraint(equalTo: self.filmImageView.trailingAnchor, constant: 10),
            self.titleFilmLabel.trailingAnchor.constraint(equalTo: self.likeButton.leadingAnchor, constant: 5)
        ])
    }
    
    private func configConstraintDateFilmLabel(){
        NSLayoutConstraint.activate([
            self.dateFilmLabel.topAnchor.constraint(equalTo: self.titleFilmLabel.bottomAnchor),
            self.dateFilmLabel.leadingAnchor.constraint(equalTo: self.filmImageView.trailingAnchor, constant: 10),
        ])
    }
    
    private func configConstraintLikeButton(){
        NSLayoutConstraint.activate([
            self.likeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.likeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.likeButton.widthAnchor.constraint(equalToConstant: 30),
            self.likeButton.heightAnchor.constraint(equalToConstant: 30),
            self.imageLikeButton.widthAnchor.constraint(equalToConstant: 30),
            self.imageLikeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
