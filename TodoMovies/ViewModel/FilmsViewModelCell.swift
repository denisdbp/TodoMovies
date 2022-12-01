//
//  FilmsViewModelCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

class FilmsViewModelCell {
    
    //MARK: Atributos
    private var model:MovieModel
    
    //MARK: Init
    // Aqui inicio o objeto model para que toda vez que houver a scrollagem da TableView o mesmo apresente os dados
    // Então neste caso esse init é sempre utilizado toda vez que houver uma scrollagem
    init(model:MovieModel) {
        self.model = model
    }
    
    //MARK: Variaveis Gets
    public var getModel:MovieModel {
        return self.model
    }
    
    public var getFilmImage:String {
        return self.model.backdrop_path
    }
    
    public var getFilmTitle:String {
        return self.model.original_title
    }
    
    public var getDateFilm:String {
        return self.model.release_date
    }
    
    public var getLike:Bool {
        return self.model.video
    }
    
    //MARK: Metodos
    // Função que requisita a imagem do Filme para a celula da TableView de Lista de Filmes
    public func getBackDropPath() -> Data?{
        guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(self.model.backdrop_path)") else {return nil}
        do{
            let data = try Data(contentsOf: urlImage)
            return data
        }catch{
            
        }
        return nil
    }
    
    // Funcao que atualiza o estado atual do like feed selecionado
    public func updateLiked(liked:Bool){
        self.model.video = liked
    }
}
