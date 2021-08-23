//
//  LoadingMoreViewModel.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/08/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

enum LoadingMoreState {
    case none, loadingMore
}

class LoadingMoreViewModel: LoadingViewModel {
    @Published var loadingMoreState: LoadingMoreState = .none
    
    var totalResults = 0
    var currentPage = 0
}
