//
//  Movie.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

class Movie: Decodable {
    let imdbId: String
    let title: String
    let year: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title  = "Title"
        case year   = "Year"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
