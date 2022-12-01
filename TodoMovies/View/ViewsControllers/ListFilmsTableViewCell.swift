//
//  ListFilmsTableViewCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

class ListFilmsTableViewCell: UITableViewCell {
    
    //MARK: Atributos
    lazy var listFilmsCellView:ListFilmsCellView = {
        let view = ListFilmsCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let identifier = "ListFilmsTableViewCell"
    private var viewModel:FilmsViewModelCell?
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsCellView, isEqualTo: self.contentView)
        self.configAccessibility()
        self.listFilmsCellView.delegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Metodos
    // Função que configura as celulas recebendo o objeto populado da ListFilmsViewController
    // Esta função esta sendo requisitada na ListFilmsViewController na configuração das celulas
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
    
    // Configuração de acessibilidade dos elementos
    private func configAccessibility(){
        self.contentView.isAccessibilityElement = true
        self.contentView.accessibilityLabel = "Células referente a lista de filmes"
        self.contentView.accessibilityIdentifier = "celulaListaDeFilmes"
    }
    
    // Aqui faço o preenchimento do coracão do botao de Like e uso o video que vem retornado do JSON
    // que no caso ele é um Bool
    private func likedFeed(){
        guard let viewModel = self.viewModel else {return}
        if viewModel.getLike == false {
            self.updateLiked(liked: true)
            self.listFilmsCellView.likeButton.setImage(UIImage(named: "heartPreenchido")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }else {
            self.updateLiked(liked: false)
            self.listFilmsCellView.likeButton.setImage(UIImage(named: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    // Aqui faço o update na ViewModel referente a true ou false no liked
    private func updateLiked(liked:Bool){
        self.viewModel?.updateLiked(liked: liked)
    }
}

extension ListFilmsTableViewCell:ListFilmsCellViewProtocol {
    func buttonLike() {
        self.likedFeed()
    }
}
