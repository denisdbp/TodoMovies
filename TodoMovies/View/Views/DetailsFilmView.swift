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
        image.isUserInteractionEnabled = true
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
    
    lazy var viewScroll : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var overviewFilmLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.colorWhite
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var returnButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "seta-esquerda"), for: .normal)
        button.setTitle("Voltar", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        self.configConstraintsFilmImageView()
        self.configConstraintsTitleFilmLabel()
        self.configConstraintsVoteCountLabel()
        self.configConstraintsPopularityViewsLabel()
        self.configScrollView()
        self.configConstraintsOverviewFilmLabel()
        self.configConstraintsReturnButton()
        ConfigGradient.configBackgroundImage(view: self.filmImageView)
        self.configAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(self.filmImageView)
        self.addSubview(self.titleFilmLabel)
        self.addSubview(self.voteCountLabel)
        self.addSubview(self.popularityViewsLabel)
        self.addSubview(self.scrollView)
        self.filmImageView.addSubview(self.returnButton)
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
            self.titleFilmLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.titleFilmLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.titleFilmLabel.bottomAnchor.constraint(equalTo: self.voteCountLabel.topAnchor, constant: -5)
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
    
    private func configScrollViewConstraints(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.titleFilmLabel.bottomAnchor, constant: 30),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configConstraintsOverviewFilmLabel(){
        NSLayoutConstraint.activate([
            self.overviewFilmLabel.topAnchor.constraint(equalTo: self.viewScroll.topAnchor, constant: 5),
            self.overviewFilmLabel.leadingAnchor.constraint(equalTo: self.viewScroll.leadingAnchor, constant: 10),
            self.overviewFilmLabel.trailingAnchor.constraint(equalTo: self.viewScroll.trailingAnchor, constant: -10),
            self.overviewFilmLabel.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func configConstraintsReturnButton(){
        NSLayoutConstraint.activate([
            self.returnButton.topAnchor.constraint(equalTo: self.filmImageView.topAnchor, constant: 50),
            self.returnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.returnButton.widthAnchor.constraint(equalToConstant: 50),
            self.returnButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configViewScrollConstraints(){
        NSLayoutConstraint.activate([
            self.viewScroll.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.viewScroll.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.viewScroll.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.viewScroll.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.viewScroll.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.viewScroll.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func configScrollView(){
        self.scrollView.addSubview(self.viewScroll)
        self.configViewScrollConstraints()
        self.configScrollViewConstraints()
        self.viewScroll.addSubview(self.overviewFilmLabel)
    }
    
    // Configuração de acessibilidade dos elementos
    private func configAccessibility(){
        
        self.filmImageView.isAccessibilityElement = true
        self.filmImageView.accessibilityTraits = .image
        self.filmImageView.accessibilityLabel = "Imagem do filme"
        self.filmImageView.accessibilityIdentifier = "imagemDoFilme"
        
        self.titleFilmLabel.isAccessibilityElement = true
        self.titleFilmLabel.accessibilityTraits = .staticText
        self.titleFilmLabel.accessibilityLabel = "Titulo do filme"
        self.titleFilmLabel.accessibilityIdentifier = "tituloDoFilme"
        
        self.voteCountLabel.isAccessibilityElement = true
        self.voteCountLabel.accessibilityTraits = .staticText
        self.voteCountLabel.accessibilityLabel = "Quantidade de Likes do filme"
        self.voteCountLabel.accessibilityIdentifier = "likesDoFilme"
        
        self.popularityViewsLabel.isAccessibilityElement = true
        self.popularityViewsLabel.accessibilityTraits = .staticText
        self.popularityViewsLabel.accessibilityLabel = "Quantidade de Views do filme"
        self.popularityViewsLabel.accessibilityIdentifier = "viewsDoFilme"
        
        self.overviewFilmLabel.isAccessibilityElement = true
        self.overviewFilmLabel.accessibilityTraits = .staticText
        self.overviewFilmLabel.accessibilityLabel = "Descrição do filme"
        self.overviewFilmLabel.accessibilityIdentifier = "descricaoDoFilme"
        
        self.returnButton.isAccessibilityElement = true
        self.overviewFilmLabel.accessibilityTraits = .button
        self.overviewFilmLabel.accessibilityLabel = "Botão retornar para tela principal"
        self.overviewFilmLabel.accessibilityIdentifier = "botaoRetornar"
        
        self.scrollView.isAccessibilityElement = true
        self.scrollView.accessibilityIdentifier = "scrollDescricaoFilme"
        
        self.viewScroll.isAccessibilityElement = true
        self.viewScroll.accessibilityIdentifier = "viewDaScrollDescricaoFilme"
    }
}
