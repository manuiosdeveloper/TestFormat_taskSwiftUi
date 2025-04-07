//
//  ProductDetailView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @StateObject private var viewModelDataSave = ProductStorageViewModel()
    @StateObject private var viewModelAlert = AlertViewModel()
    
    @State private var showAlert = false


    @State private var navigateToSavedList = false
    @Environment(\.dismiss) private var dismiss
    @State private var isWishlisted = false




    let product: Product
//    
//    
//    @ObservedObject var productStore = ProductStore()
//    @ObservedObject var cartStore = CartStore()
    let imageNames: [String] = [
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
    ]
    
    var body: some View {
        let imageUrl: String = viewModel.product.image ?? ""

        VStack(spacing: 16) {
            HStack {
                
                Button(action: {
                    dismiss() // Navigates back
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                    
                    
                }
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hex: "#F0F1F2"))
                .clipShape(Circle())
                Spacer()
                
                Button(action: {
                    
                    
                    viewModelAlert.showSimpleAlert(
                        title: "WishList!",
                        message: "Are you sure you want to add this item to your wishList?",
                        okButtonText: "YES",
                        okAction: {
                            isWishlisted.toggle()
                            
                            let newProduct = Productproduct(
                                id: Int.random(in: 1...1000),
                                title:  viewModel.product.title ?? "",
                                price: viewModel.product.price ?? 0.0,
                                category: viewModel.product.category,
                                description: viewModel.product.description ?? "",
                                image: imageUrl
                            )
//                            viewModelDataSave.saveProduct(newProduct)
//                            navigateToSavedList = true // trigger navigation
                         
                        }
                    )
                    
                    
                   
                }) {
                    
                    
                    Image(systemName: isWishlisted ? "heart.fill" : "heart")
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color(hex: "#F0F1F2"))
                        .foregroundColor(.red)
                        .clipShape(Circle())
                }
                
                
                
                
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hex: "#F0F1F2"))
                    .clipShape(Circle())
            }
           
            ImageCarouselView(imageNames: imageUrl)
            //ImageCarouselView(imageNames: viewModel.)
            ProductInfoView(product: viewModel.product)
            
            
            Spacer()
            DeliveryInfoView(date: viewModel.product.description ?? "")
            // AddToCartButton()
            Button(action: {
                //viewModelAlert.showSimpleError(message: "Something went wrong.")
                
                viewModelAlert.showSimpleAlert(
//                    title: "Oops!",
                    message: "Are you sure you want add this in Cart.",
                    okButtonText: "YES",
                    okAction: {
                        
                        let newProduct = Productproduct(
                            id: Int.random(in: 1...1000),
                            title:  viewModel.product.title ?? "",
                            price: viewModel.product.price ?? 0.0,
                            category: viewModel.product.category,
                            description: viewModel.product.description ?? "",
                            image: imageUrl
                        )
                        viewModelDataSave.saveProduct(newProduct)
                        navigateToSavedList = true // trigger navigation
                        print("Retry tapped")
                    }
                )
                
                
            }) {
                Text("Add to cart")
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#C3E705"))
                    .foregroundColor(Color(hex: "#000000"))
                    .cornerRadius(10)
            }
            
            Text("Delivery on 26 october")
                .font(.system(size: 10, weight: .semibold)) // Title font
            
            
            // Hidden NavigationLink triggered by state
            NavigationLink(
                destination: CartView(viewModelSave: viewModelDataSave),
                isActive: $navigateToSavedList
            ) {
                EmptyView()
            }
            
            .alert(item: $viewModelAlert.commonAlert) { alert in
                Alert(
                    title: Text(alert.title),
                    message: Text(alert.message),
                    primaryButton: alert.primaryButton,
                    secondaryButton: alert.secondaryButton ?? .default(Text("Cancel"))
                )
            }
            .navigationBarBackButtonHidden(true)
            
        }
        .padding()
        
        
    }
}

//#Preview {
//    ProductDetailView()
//}
