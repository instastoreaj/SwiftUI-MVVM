//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 03/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
