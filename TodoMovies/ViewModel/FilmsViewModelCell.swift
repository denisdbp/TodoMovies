//
//  FilmsViewModelCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

class FilmsViewModelCell {
    
    var model:MovieModel
    
    init(model:MovieModel) {
        self.model = model
    }
    
    public var getFilmImage:String {
        return self.model.backdrop_path
    }
    
    public var getFilmTitle:String {
        return self.model.original_title
    }
    
    public func getBackDropPath() -> Data?{
        guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(self.model.backdrop_path)") else {return nil}
            do{
                let data = try Data(contentsOf: urlImage)
                    return data
            }catch{
                print("Erro ao carregar a imagem")
            }
            return nil
        }
}
