//
//  ApiFilmsProvider.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

enum OptionProvider {
    case listFilms
    case detailFilm
}

class ApiFilmsProvider {
    
    private var option = ""
    private var keyApi = ""
    private var language = ""
    
    public func requestApi(option:OptionProvider, completion:@escaping(Result<[Movies], Error>)->Void){
        switch option {
        case .listFilms:
            self.option = "https://api.themoviedb.org/3/movie/436270/similar?"
            self.keyApi = "api_key=0f9a3cef12bf5788122f13b1532b9b9e"
            self.language = "&language=pt-BR"
        case .detailFilm:
            self.option = "https://api.themoviedb.org/3/movie/10546?"
            self.keyApi = "api_key=0f9a3cef12bf5788122f13b1532b9b9e"
            self.language = "&language=pt-BR"
        }
        guard let url = URL(string: "\(self.option)\(self.keyApi)\(self.language)") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url){(data, response, error) in
            if let data = data {
                do{
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                    completion(.success([movies]))
                }catch{
                    completion(.failure(error))
                }
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
