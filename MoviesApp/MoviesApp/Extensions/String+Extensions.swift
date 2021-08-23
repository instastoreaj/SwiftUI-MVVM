//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 05/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .addingPercentEncoding(withAllowedCharacters:
                                    .urlHostAllowed) ?? self
    }
    
    func tryDecode<T>(_ type: T.Type) -> T? where T : Decodable {
        if let data = self.data(using: .utf8) {
            return try? JSONDecoder().decode(type, from: data)
        }
        return nil
    }
}
