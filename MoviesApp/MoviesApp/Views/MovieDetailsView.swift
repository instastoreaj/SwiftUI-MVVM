//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    var movieDetailsViewModel:MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: self.movieDetailsViewModel.poster, maxHeight: 400)
                    .cornerRadius(10)
                    Text(self.movieDetailsViewModel.title)
                        .font(.title2)
                        .fontWeight(.bold)
                Text(self.movieDetailsViewModel.plot)
                Text("Director")
                    .fontWeight(.bold)
                    
                Text(self.movieDetailsViewModel.director)
                HStack{
                    Rating(rating: .constant(self.movieDetailsViewModel.rating), ratingTotal: .constant(10))
                    Text("\(self.movieDetailsViewModel.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle(self.movieDetailsViewModel.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static func getMovieDetailViewModel() -> MovieDetailsViewModel {
        let viewModel = MovieDetailsViewModel()
        viewModel.getByImdbId("tt3896198")
        return viewModel
    }
    
    static var previews: some View {
        MovieDetailsView(movieDetailsViewModel: getMovieDetailViewModel())
    }
}
