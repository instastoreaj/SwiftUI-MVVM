//
//  HttpClient.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

class HttpClient {
    
    func getMovieDetailsByImdbId(imdbId: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        
        guard let url = URL.forMovieDetailsByImdbId(imdbId) else {
            return completion(.failure(NetworkError.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.noData(error: error)))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                
                if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    return completion(.failure(NetworkError.responseError(error: errorResponse)))
                }
                
                return completion(.failure(NetworkError.decodingError))
            }
            
            return completion(.success(movieDetail))
            
        }.resume()
        
    }
    
    func getMoviesBySearch(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        let query = search.trimmedAndEscaped()
        
        guard let url = URL.forMoviesByName(query) else {
            return completion(.failure(NetworkError.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.noData(error: error)))
            }
            guard let movieResponse = try? JSONDecoder().decode(MovieReponse.self, from: data) else {
                
                if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    return completion(.failure(NetworkError.responseError(error: errorResponse)))
                }
                
                return completion(.failure(NetworkError.decodingError))
            }
            
            return completion(.success(movieResponse.movies))
            
        }.resume()
        
    }
    
    func getMoviesBySearch(search: String, page: Int, completion: @escaping (Result<MovieReponse?, NetworkError>) -> Void) {
        
        let query = search.trimmedAndEscaped()
        
        guard let url = URL.forMoviesByName(query, page: page) else {
            return completion(.failure(NetworkError.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.noData(error: error)))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieReponse.self, from: data) else {
                
                if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    return completion(.failure(NetworkError.responseError(error: errorResponse)))
                }
                
                return completion(.failure(NetworkError.decodingError))
            }
            
            return completion(.success(movieResponse))
            
        }.resume()
        
    }
}



extension Data {
    
    func tryDecode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try JSONDecoder().decode(type, from: self)
    }
}
