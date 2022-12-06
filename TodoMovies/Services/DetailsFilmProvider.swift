//
//  DetailsFilmProvider.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation

protocol DetailsFilmProviderProtocol {
    func detailsFilm(movieId:Int, completion:@escaping(Result<[DetailsFilmModel], Error>)->Void)
}

class DetailsFilmProvider:DetailsFilmProviderProtocol {
    
    // Função que requisita o detalhe do filme do Endpoint getMovieDetails selecionado na primeira tela
    public func detailsFilm(movieId:Int, completion:@escaping(Result<[DetailsFilmModel], Error>)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?\(ApiUtils.keyApi)\(ApiUtils.language)") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url){(data, response, error) in
            if let data = data {
                do{
                    let detailsMovie = try JSONDecoder().decode(DetailsFilmModel.self, from: data)
                    completion(.success([detailsMovie]))
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
