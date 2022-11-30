//
//  ApiFilmsProvider.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

class ApiFilmsProvider {
    
    // Constantes que fazem parte da API de Filmes
    private let keyApi = "api_key=0f9a3cef12bf5788122f13b1532b9b9e"
    private let language = "&language=pt-BR"
    
    //Função para requisitar a lista de filmes do Endpoint getSimilarMovies da primeira tela do aplicativo
    public func listFilms(completion:@escaping(Result<[Movies], Error>)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/4474/similar?\(self.keyApi)\(self.language)") else {return}
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
    
    // Função que requisita o detalhe do filme do Endpoint getMovieDetails selecionado na primeira tela
    public func detailsFilm(movieId:Int, completion:@escaping(Result<[DetailsFilmModel], Error>)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?\(self.keyApi)\(self.language)") else {return}
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
