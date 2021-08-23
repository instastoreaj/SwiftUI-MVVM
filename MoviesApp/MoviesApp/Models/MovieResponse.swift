//
//  MovieResponse.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

struct MovieReponse: Decodable {
    let movies: [Movie]
    let totalResults: String

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults = "totalResults"
    }
}
