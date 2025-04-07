//
//  SearchBarView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Search Bar View
struct SearchBarView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search the entire shop", text: .constant(""))
                    
            }
            .padding(.horizontal,60)
            .foregroundColor(Color(hex: "#E7E9EA"))
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        
    }
}


#Preview {
    SearchBarView()
}
