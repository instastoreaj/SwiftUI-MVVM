//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

class MovieDetailsViewModel: LoadingViewModel {
    
   var movieDetails: MovieDetail? = nil
    
    var httpClient: HttpClient = HttpClient()
    
    func getByImdbId(_ imdbId: String) {
        
        if imdbId.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMovieDetailsByImdbId(imdbId: imdbId) { result in
            switch result {
            case .success(let movieDetails):
                if let movieDetails = movieDetails {
                    DispatchQueue.main.async {
                        self.movieDetails = movieDetails
                        self.loadingState = .success
                    }
                }
                
                break
            case .failure(let networkError):
                // TODO: handle the error
                print(networkError.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                break
            }
        }
    }
    
    var title: String {
        stringValue(movieDetails?.title)
    }
    
    var poster: String {
        stringValue(movieDetails?.poster)
    }
    
    var plot: String {
        stringValue(movieDetails?.plot)
    }
    
    var rating: Int {
        get {
            return Int(ceil(doubleValue(movieDetails?.rated)))
        }
    }
    
    var director: String {
        stringValue(movieDetails?.director)
    }
}
