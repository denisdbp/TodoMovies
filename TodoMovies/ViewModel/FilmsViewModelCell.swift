//
//  FilmsViewModelCell.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation
import RxSwift

class FilmsViewModelCell {
    
    private var model:MovieModel
    
    init(model:MovieModel) {
        self.model = model
    }
    
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
