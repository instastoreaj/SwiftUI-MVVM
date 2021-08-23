//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

extension URL {
    static func forMoviesByName( _ search: String, page: Int = 1) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(search)&r=json&type=movie&plot=short&page=\(page)&apikey=\(Constants.API_KEY)")
    }
    static func forMovieDetailsByImdbId( _ imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
}
