//
//  RatingView.swift
//  SwiftUIRatings
//
//  Created by Lucas Ferreira Machado on 6/20/20.
//  Copyright © 2020 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct Rating: View {
    
    @Binding var rating: Int?
    @Binding var ratingTotal: Int
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...ratingTotal, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: .constant(3), ratingTotal: .constant(5))
    }
}
