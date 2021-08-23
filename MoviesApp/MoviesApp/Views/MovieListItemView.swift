//
//  MovieListItemView.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct MovieListItemView: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItemView(movie: MockedMovieViewModel)
    }
}

