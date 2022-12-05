//
//  ListFilmsViewModel.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation
import RxSwift
import RxCocoa

class ListFilmsViewModel {
    
    //MARK: Atributos
    private var listFilmsProvider:ListFilmProvider?
    // Variaveis que estão sendo observadas quando seu valor mudar
    public let model: PublishSubject<[MovieModel]> = PublishSubject()
    public let detailsMovieModel:PublishSubject<[DetailsFilmModel]> = PublishSubject()
    public let loading:PublishSubject<Bool> = PublishSubject()
    public let error:PublishSubject<Error> = PublishSubject()
    public let disposeBag = DisposeBag()
    
    //MARK: Init
    // Aqui iniciou a ViewModel com a requisição escolhida do Endpoint getSimilarMovies
    init(listFilmsProvider:ListFilmProvider, movieId:Int){
        self.listFilmsProvider = listFilmsProvider
        self.listFilms()
    }
    
    //MARK: Metodos
    // Função que requisita na classe ListFilmsProvider o JSON da API do Endpoint getSimilarMovies
    private func listFilms(){
        self.listFilmsProvider?.listFilms(completion: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.model.onNext(movies[0].results)
                }
                self.loading.onNext(false)
            case .failure(let error):
                self.error.onNext(error)
            }
        })
    }
}
