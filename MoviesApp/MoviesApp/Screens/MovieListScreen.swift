//
//  MoviesScreen.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 03/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct MoviesListScreen: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State private var movieName = ""
    init() {
        movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onEditingChanged: { _ in
            }, onCommit: {
                movieListViewModel.searchByName(movieName)
            }).padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer().navigationBarTitle("Movies")
            
            if movieListViewModel.loadingState  == .success {
                MovieListView(viewModel: self.movieListViewModel)
            } else if movieListViewModel.loadingState  == .failed {
                FailedView()
            } else if movieListViewModel.loadingState  == .loading {
                LoadingView()
            }
            
        }
        .embedNavigationView()
        
    }
}

struct MoviesScreen_Success_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MoviesListScreen()
        movie.onAppear{
            movie.movieListViewModel.movies = MockedMovieListViewModel
            movie.movieListViewModel.loadingState = .success
        }
    }
}

struct MoviesScreen_Loading_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MoviesListScreen()
        movie.onAppear{
            movie.movieListViewModel.loadingState = .loading
        }
    }
}

struct MoviesScreen_Failed_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MoviesListScreen()
        movie.onAppear{
            movie.movieListViewModel.loadingState = .failed
        }
    }
}
