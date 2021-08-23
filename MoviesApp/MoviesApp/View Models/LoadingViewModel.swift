//
//  LoadingState.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

enum LoadingState {
    case none, loading, success, failed
}

class LoadingViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
