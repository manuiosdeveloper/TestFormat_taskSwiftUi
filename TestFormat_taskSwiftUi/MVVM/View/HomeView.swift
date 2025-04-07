//
//  HomeView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Home View
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var viewModelAlert = AlertViewModel()
    @State private var showAlert = false
    

    var body: some View {
        
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    HeaderView()
                    SearchBarView()
                    DiscountBannerView()
                }
                .padding(.bottom)
                CategoriesView(categories: viewModel.categories)
                FlashSaleView(products: viewModel.productArray)
                Spacer()
                BottomNavBarView()
                
            }
            
            
            .padding()
            .navigationTitle("")
            
            .onAppear {
                if viewModel.iserror {
                    showAlert = true
                }
            }
            
           
            .alert( viewModel.errorMessage ?? "Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            
                    .alert(item: $viewModelAlert.commonAlert) { alert in
                               Alert(
                                   title: Text(alert.title),
                                   message: Text(alert.message),
                                   primaryButton: alert.primaryButton,
                                   secondaryButton: alert.secondaryButton ?? .default(Text("Cancel"))
                               )
                           }
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(true)
        }
      
        .refreshable {

            viewModel.Apicalling()
           // callInsightsApiWithSelectedDate()

        }
        .onAppear {
            viewModel.Apicalling()
        }
    }
        
}

#Preview {
    HomeView()
    
    
}
