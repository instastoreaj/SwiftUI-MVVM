//
//  NetworkError.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    case responseError(error: ErrorResponse )
    case invalidQuery
    case badUrl
    case noData(error: Error?)
    case decodingError
}
