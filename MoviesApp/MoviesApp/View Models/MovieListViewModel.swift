//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

class MovieListViewModel: LoadingMoreViewModel {
    
    @Published var movies = [MovieViewModel]()

    var search = ""
    var repeatedItems = 0
    var httpClient: HttpClient = HttpClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        if self.loadingState == .loading {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBySearch(search: name, page: 1) { result in
            switch result {
            case .success(let movieReponse):
                if let movieReponse = movieReponse {
                    DispatchQueue.main.async {
                        self.search = name
                        self.repeatedItems = 0
                        self.currentPage = 1
                        self.totalResults = Int(movieReponse.totalResults) ?? 0
                        self.movies = movieReponse.movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
                
                break
            case .failure(let networkError):
                // TODO: handle the errors
                print(networkError.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                break
            }
        }
    }
    
    
    func loadMore() {
        let name = self.search
        
        if name.isEmpty {
            return
        }
        
        if self.loadingState == .loading || self.loadingMoreState == .loadingMore {
            return
        }
        
        if (!hasNextPage()) {
            return
        }
        
        self.loadingMoreState = .loadingMore
        
        let page = currentPage + 1
        
        httpClient.getMoviesBySearch(search: name, page: page) { result in
            switch result {
            case .success(let movieReponse):
                if let movieReponse = movieReponse {
                    DispatchQueue.main.async {
                        self.currentPage += 1
                        self.totalResults = Int(movieReponse.totalResults) ?? 0
                        self.movies.append(contentsOf: movieReponse.movies.map(MovieViewModel.init).filter({ mvm in
                            let containsId = self.movies.contains(where: {$0.imdbId == mvm.imdbId})
                            if containsId {
                                self.repeatedItems += 1
                            }
                            return !containsId
                        }) )
                        
                        self.loadingMoreState = .none
                    }
                }
                
                break
            case .failure(let networkError):
                // TODO: handle the error
                print(networkError.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingMoreState = .none
                }
                break
            }
        }
    }
    
    func hasNextPageForItem(_ movie: MovieViewModel) -> Bool {
        if hasNextPage() {
            if let last = movies.last {
                return last.imdbId == movie.imdbId
            }
        }
        return false
    }
    
    func getItemsCount() -> Int {
        return movies.count + repeatedItems
    }
    
    func hasNextPage() -> Bool {
        return  getItemsCount() < totalResults
    }
}
