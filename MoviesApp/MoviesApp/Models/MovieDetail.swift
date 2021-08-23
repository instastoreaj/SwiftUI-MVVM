//
//  MovieDetaill.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

class MovieDetail: Decodable {
    let imdbId: String
    let title: String
    let year: String
    let poster: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    
    private enum CodingKeys: String, CodingKey {
        case title  = "Title"
        case year   = "Year"
        case poster = "Poster"
        case imdbId = "imdbID"
        case rated = "imdbRating"
        case plot =  "Plot"
        case director = "Director"
        case actors = "Actors"
    }
}
