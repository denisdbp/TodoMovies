//
//  FilmsViewModel.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

class FilmsViewModel {
    
    private var apiFilmsProvider:ApiFilmsProvider?
    public var model:[MovieModel] = []
    
    init(apiFilmsProvider:ApiFilmsProvider, option:OptionProvider){
        self.apiFilmsProvider = apiFilmsProvider
        self.apiFilmsProvider?.requestApi(option: option, completion: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movies):
                self.model = movies[0].results
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    public func getIndexPath(indexPath : IndexPath) -> MovieModel{
            return self.model[indexPath.row]
        }
}
