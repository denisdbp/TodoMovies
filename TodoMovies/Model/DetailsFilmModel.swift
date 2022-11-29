//
//  DetailsFilmModel.swift
//  TodoMovies
//
//  Created by Admin on 29/11/22.
//

import UIKit

struct DetailsFilmModel:Decodable {
    let id : Int
    let original_title : String
    let overview : String
    let backdrop_path : String
    let poster_path : String
    let popularity: Double
    let vote_count : Int
}
