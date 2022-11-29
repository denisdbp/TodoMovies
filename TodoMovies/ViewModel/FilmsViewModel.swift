//
//  FilmsViewModel.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation
import RxSwift
import RxCocoa

class FilmsViewModel {
    
    private var apiFilmsProvider:ApiFilmsProvider?
    public let model: PublishSubject<[MovieModel]> = PublishSubject()
    private let disposeBag = DisposeBag()
    
    init(apiFilmsProvider:ApiFilmsProvider, option:OptionProvider){
        self.apiFilmsProvider = apiFilmsProvider
        self.apiFilmsProvider?.requestApi(option: option, completion: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.model.onNext(movies[0].results)
                }
            case .failure(let error):
                self.model.onError(error)
            }
        })
    }
}
