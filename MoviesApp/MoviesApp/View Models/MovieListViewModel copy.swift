//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

class MovieListViewModel: ViewModelBase {
    
    @Published var movies = [MovieViewModel]()
    
    var httpClient: HttpClient = HttpClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBySearch(search: name) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
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

}
