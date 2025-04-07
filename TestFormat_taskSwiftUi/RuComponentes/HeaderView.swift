//
//  HeaderView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Header View
struct HeaderView: View {
    var body: some View {
        HStack {
            Image("offer")
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hex: "#C3E705"))
                .clipShape(Circle())
            VStack(alignment: .center) {
                Text("Delivery address")
                    .font(.caption)
                Text("92 High Street, London")
                    .font(.headline)
                    .padding(.horizontal)
            }
            Spacer()
            ZStack {
                Image("notification-bell-2")
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hex: "#F0F1F2"))
                    .clipShape(Circle())
                
                Text(" ")
                    .font(.caption2)
                    .frame(width: 13, height: 13)
                    .background(Circle().fill(Color(hex: "#B2D6D2")))
                    .foregroundColor(.white)
                    .padding(.top, -25)
                    .padding(.leading, 30)
                
            }
            
        }
    }
}
#Preview {
    HeaderView()
}
