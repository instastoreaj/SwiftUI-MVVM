//
//  URLImage.swift
//  URLImageDemo
//
//  Created by Lucas Ferreira Machado on 6/17/20.
//  Copyright © 2020 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    var maxWidth: CGFloat
    var maxHeight: CGFloat
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder", maxWidth: CGFloat = .infinity, maxHeight: CGFloat = .infinity) {
        self.url = url
        self.placeholder = placeholder
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData, 
           let imageData = UIImage(data: data) {
            _resize(view: Image(uiImage:imageData))
        } else {
            _resize(view: Image("placeholder"))
        }
    }
    
    func _resize(view: Image) -> some View {
        VStack{
            if maxWidth != .infinity || maxHeight != .infinity {
                view.resizable().frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: .center)
            } else {
                view.resizable()
            }
        }
    }
    
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg", maxWidth: 240, maxHeight: 240)
    }
}
