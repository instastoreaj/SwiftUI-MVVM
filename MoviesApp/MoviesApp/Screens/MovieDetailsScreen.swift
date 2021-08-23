//
//  MovieDetailsScreen.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    var imdbId: String
    @ObservedObject var movieDetailsViewModel = MovieDetailsViewModel()
    
    var body: some View {
        VStack {
            if self.movieDetailsViewModel.loadingState  == .success {
                MovieDetailsView(movieDetailsViewModel: self.movieDetailsViewModel)
            } else if self.movieDetailsViewModel.loadingState  == .failed {
                FailedView()
            } else if self.movieDetailsViewModel.loadingState  == .loading {
                LoadingView()
            }
        }
        .onAppear {
            self.movieDetailsViewModel.getByImdbId(self.imdbId)
        }
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(imdbId: "tt3896198")
    }
}
