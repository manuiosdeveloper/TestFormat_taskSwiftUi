//
//  DiscountBannerView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Discount Banner View
struct DiscountBannerView: View {
    var body: some View {
        HStack {
            Text("Delivery is")
            Text("50%")
                .bold()
                .padding(5)
                .background(Color.white)
                .cornerRadius(5)
            Text("cheaper")
            Spacer()
        }
        .padding()
        .background(Color(hex: "#B2D6D2"))
        .cornerRadius(10)
    }
}

#Preview {
    DiscountBannerView()
}
