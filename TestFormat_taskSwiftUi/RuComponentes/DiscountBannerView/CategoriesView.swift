//
//  CategoriesView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Categories View
struct CategoriesView: View {
    let categories: [CategoryItem]
    //    let categoriesImages: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories").font(.title2)
                    .bold()
                Spacer()
                Text("See All")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(hex: "#818789"))
                
                    .font(.title)
                    .bold()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0F1F2"))
                        .frame(width: 20, height: 20)
                    
                    
                    Image("right-arrow-angle-2")
                        .frame(width: 20, height: 20)
                }
                
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(categories) { category in
                        VStack(alignment: .center, spacing: 10) {
                            
                            if let imageName = category.imageName {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color.gray.opacity(0.1))
                                        .frame(width: 60, height: 60)
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                        .clipShape(Circle())
                                }
                            }
                            
                            if let imageName = category.name {
                                Text(imageName)
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(Color(hex: "#151515"))
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
}

//#Preview {
//    CategoriesView(categories: [""])
//}
