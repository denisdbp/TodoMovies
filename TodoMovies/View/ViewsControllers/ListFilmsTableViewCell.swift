//
//  ListFilmsTableViewCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import UIKit

protocol ListFilmsTableViewCellProtocol {
    func reloadData(_ model:MovieModel)
}

class ListFilmsTableViewCell: UITableViewCell {
    
    //MARK: Variaveis
    lazy var listFilmsCellView:ListFilmsCellView = {
        let view = ListFilmsCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var delegate:ListFilmsTableViewCellProtocol?
    
    static let identifier = "ListFilmsTableViewCell"
    private var viewModel:FilmsViewModelCell?
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = CustomColors.colorBlack
        self.addSubViews()
        ConfigConstraints.configConstraintsEqualToView(element: self.listFilmsCellView, isEqualTo: self.contentView)
        self.configAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Funções
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
    
    public func delegate(delegate:ListFilmsTableViewCellProtocol) {
        self.delegate = delegate
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.listFilmsCellView)
    }
    
    // Configuração de acessibilidade dos elementos
    private func configAccessibility(){
        self.contentView.isAccessibilityElement = true
        self.contentView.accessibilityLabel = "Células referente a lista de filmes"
    }
}
