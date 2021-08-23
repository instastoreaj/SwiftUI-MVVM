//
//  FailedView.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("oops")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity)
                .padding()
            Spacer()
        }.padding()
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
