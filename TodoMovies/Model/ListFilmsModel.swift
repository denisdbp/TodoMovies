//
//  ListFilmsModel.swift
//  TodoMovies
//
//  Created by Admin on 28/11/22.
//

import Foundation

struct Movies: Decodable {
    let results : [MovieModel]
}

struct MovieModel: Decodable {
    let id : Int
    let original_title : String
    let overview : String
    let backdrop_path : String
    let poster_path : String
    let release_date : String
    var video : Bool
}
