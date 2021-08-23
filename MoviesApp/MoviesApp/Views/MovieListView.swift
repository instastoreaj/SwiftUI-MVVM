//
//  MovieList.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 03/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.movies, id:\.imdbId) { movie in
                    NavigationLink(
                        destination: MovieDetailsScreen(imdbId: movie.imdbId)) {
                        MovieListItemView(movie: movie)
                            .onAppear {
                                if viewModel.hasNextPageForItem(movie) {
                                    viewModel.loadMore()
                                }
                            }
                    }.id(UUID())
                }
                if viewModel.loadingMoreState == .loadingMore {
                    ProgressView()
                }
            }
        }.padding()
    }
}
