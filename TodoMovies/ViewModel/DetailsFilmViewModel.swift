//
//  DetailsFilmViewModel.swift
//  TodoMovies
//
//  Created by Admin on 05/12/22.
//

import Foundation
import RxSwift

class DetailsFilmViewModel {
    
    //MARK: Atributos
    private var detailsFilmProvider:DetailsFilmProvider?
    // Variaveis que estão sendo observadas quando seu valor mudar
    public let detailsMovieModel:PublishSubject<[DetailsFilmModel]> = PublishSubject()
    public let error:PublishSubject<Error> = PublishSubject()
    public let disposeBag = DisposeBag()
    
    //MARK: Init
    // Aqui iniciou a ViewModel com a requisição do EndPoint getMovieDetails
    init(detailsFilmProvider:DetailsFilmProvider, movieId:Int) {
        self.detailsFilmProvider = detailsFilmProvider
        self.detailsFilm(movieId: movieId)
    }
    
    //MARK: Metodos
    // Função que requisita na classe DetailsFilmProvider o JSON da API do Endpoint getMovieDetails
    private func detailsFilm(movieId:Int){
        self.detailsFilmProvider?.detailsFilm(movieId: movieId, completion: { result in
            switch result {
            case .success(let detailsMovie):
                DispatchQueue.main.async {
                self.detailsMovieModel.onNext(detailsMovie)
                }
            case .failure(let error):
                self.error.onNext(error)
            }
        })
    }
    
    // Esta função requisita a imagem do filme para a tela de detalhes do filme
    public func getImageDetailsFilm(urlImage:String)->Data?{
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlImage)") else {return nil}
        do {
            let data = try Data(contentsOf: url)
            return data
        }catch {
            
        }
        return nil
    }
    
    // Função para verificar o valor recebido de vote_count e assim poder fazer os tratamentos corretos
    public func configNumberVoteCount(voteCount:Int) -> String{
        if voteCount < 999 {
            return "\(String(voteCount))K Likes"
        }
        if voteCount > 999 && voteCount < 999999 {
            return "\(self.formatNumberToDecimal(value: Double(voteCount)))K Likes"
        }
        if voteCount > 999999 {
            return "\(self.formatNumberToDecimal(value: Double(voteCount)))M Likes"
        }
        return ""
    }
    
    // Função para verificar o valor recebido de popularityViews e assim poder fazer os tratamentos corretos
    public func configNumberPopularityViews(popularityViews:Double) -> String{
        let popularity = NSString(format: "%.1f", popularityViews)
        if popularityViews < 999 {
            return "\(String(popularity))K Views"
        }
        if popularityViews > 999 && popularityViews < 999999 {
            return "\(String(popularity))K Views"
        }
        if popularityViews > 999999 {
            return "\(String(popularity))M Views"
        }
        return ""
    }
    
    // Função para formatar valores para decimal, que no caso esta sendo utilizado no VoteCount que é um Int
    private func formatNumberToDecimal(value:Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt_BR")
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:value)) ?? "Valor indefinido"
    }
}
