//
//  ErrorResponse.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let response: String
    let error: String
    
    private enum CodingKeys: String, CodingKey {
        case response  = "Response"
        case error   = "Error"
    }
}
