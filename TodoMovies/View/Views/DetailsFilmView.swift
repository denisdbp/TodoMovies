//
//  DetailsFilmView.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class DetailsFilmView: UIView {
    
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
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    lazy var voteCountLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var popularityViewsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var overviewFilmLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        self.configConstraintsFilmImageView()
        self.configConstraintsTitleFilmLabel()
        self.configConstraintsVoteCountLabel()
        self.configConstraintsPopularityViewsLabel()
        self.configConstraintsOverviewFilmLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(self.filmImageView)
        self.addSubview(self.titleFilmLabel)
        self.addSubview(self.voteCountLabel)
        self.addSubview(self.popularityViewsLabel)
        self.addSubview(self.overviewFilmLabel)
    }
    
    private func configConstraintsFilmImageView(){
        NSLayoutConstraint.activate([
            self.filmImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.filmImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.filmImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.filmImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configConstraintsTitleFilmLabel(){
        NSLayoutConstraint.activate([
            self.titleFilmLabel.topAnchor.constraint(equalTo: self.filmImageView.bottomAnchor, constant: 10),
            self.titleFilmLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    private func configConstraintsVoteCountLabel(){
        NSLayoutConstraint.activate([
            self.voteCountLabel.topAnchor.constraint(equalTo: self.titleFilmLabel.bottomAnchor, constant: 5),
            self.voteCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
    
    private func configConstraintsPopularityViewsLabel(){
        NSLayoutConstraint.activate([
            self.popularityViewsLabel.topAnchor.constraint(equalTo: self.titleFilmLabel.bottomAnchor, constant: 5),
            self.popularityViewsLabel.leadingAnchor.constraint(equalTo: self.voteCountLabel.trailingAnchor, constant: 5)
        ])
    }
    
    private func configConstraintsOverviewFilmLabel(){
        NSLayoutConstraint.activate([
            self.overviewFilmLabel.topAnchor.constraint(equalTo: self.titleFilmLabel.bottomAnchor, constant: 20),
            self.overviewFilmLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.overviewFilmLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5)
        ])
    }
}
