//
//  Utils.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

func stringValue(_ string: String?) -> String {
    return string ?? ""
}

func doubleValue(_ string: String?) -> Double {
    return Double(string ?? "0.0") ?? 0.0
}

