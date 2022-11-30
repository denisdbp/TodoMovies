//
//  FilmsViewModel.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation
import RxSwift
import RxCocoa

enum Option {
    case listFilms
    case detailFilms
}

class FilmsViewModel {
    
    private var apiFilmsProvider:ApiFilmsProvider?
    public let model: PublishSubject<[MovieModel]> = PublishSubject()
    public let detailsMovieModel:PublishSubject<[DetailsFilmModel]> = PublishSubject()
    public let loading:PublishSubject<Bool> = PublishSubject()
    public let disposeBag = DisposeBag()
    
    init(apiFilmsProvider:ApiFilmsProvider, option:Option, movieId:Int){
        self.apiFilmsProvider = apiFilmsProvider
        switch option {
        case .listFilms:
            self.listFilms()
        case .detailFilms:
            self.detailsFilm(movieId: movieId)
        }
    }
    
    private func listFilms(){
        self.apiFilmsProvider?.listFilms(completion: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.model.onNext(movies[0].results)
                }
                self.loading.onNext(false)
            case .failure(let error):
                self.model.onError(error)
            }
        })
    }
    
    private func detailsFilm(movieId:Int){
        self.apiFilmsProvider?.detailsFilm(movieId: movieId, completion: { result in
            switch result {
            case .success(let detailsMovies):
                DispatchQueue.main.async {
                    self.detailsMovieModel.onNext(detailsMovies)
                }
            case .failure(let error):
                self.detailsMovieModel.onError(error)
            }
        })
    }
    
    public func getImageDetailsFilm(urlImage:String)->Data?{
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlImage)") else {return nil}
            do {
                let data = try Data(contentsOf: url)
                return data
            }catch {
                
            }
        return nil
    }
}
