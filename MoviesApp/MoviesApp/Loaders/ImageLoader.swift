//
//  ImageLoader.swift
//  URLImageDemo
//
//  Created by Lucas Ferreira Machado on 6/17/20.
//  Copyright © 2020 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        
        guard url.contains("https://"), let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
        
    }
    
}
