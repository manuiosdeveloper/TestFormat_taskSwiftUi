//
//  ImageCarouselView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Image Carousel
struct ImageCarouselView: View {
    let imageNames : String
    
    
    var body: some View {
        TabView {
        ProductImageView(imageUrl: imageNames)
               
            
//            ForEach(imageNames, id: \..self) { imageName in
//                ProductImageView(imageUrl: imageName)
//                Image(imageName)
//                    .resizable()
//                    .scaledToFit()
//            }
        }
        .frame(width: 300, height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

//#Preview {
//    ImageCarouselView()
//}
