//
//  ListFilmProvider.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation

class ListFilmProvider {
    
    //Função para requisitar a lista de filmes do Endpoint getSimilarMovies da primeira tela do aplicativo
    public func listFilms(completion:@escaping(Result<[Movies], Error>)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/4474/similar?\(ApiUtils.keyApi)\(ApiUtils.language)") else {return}
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
                if let response = response as? HTTPURLResponse {
                    guard let error = error else {return}
                    switch response.statusCode {
                    case 400...500:
                        completion(.failure(error))
                    default:
                        break
                    }
                }
            }
        }
        task.resume()
    }
}
