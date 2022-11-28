//
//  ListFilmsTableViewCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsTableViewCell: UITableViewCell {

    static let identifier = "ListFilmsTableViewCell"
    
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
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        self.configConstraintsFilmImageView()
        self.configConstraintTitleFilmView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.filmImageView)
        self.contentView.addSubview(self.titleFilmLabel)
    }
    
    private func configConstraintsFilmImageView(){
        NSLayoutConstraint.activate([
            self.filmImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.filmImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.filmImageView.widthAnchor.constraint(equalToConstant: 50),
            self.filmImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configConstraintTitleFilmView(){
        NSLayoutConstraint.activate([
            self.titleFilmLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
}
