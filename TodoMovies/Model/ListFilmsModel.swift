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
    let original_title : String
    let overview : String
    let backdrop_path : String
    let poster_path : String
    let release_date : String
    let genre_ids : [Int]
}
