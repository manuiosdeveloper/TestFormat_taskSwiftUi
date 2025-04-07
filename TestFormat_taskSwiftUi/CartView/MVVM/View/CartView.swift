//
//  CartView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 05/04/25.
//

import SwiftUI


// MARK: - View
struct CartView: View {
    
    @StateObject private var viewModel = CartViewModel()
    @ObservedObject var viewModelSave: ProductStorageViewModel
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModelAlert = AlertViewModel()
    @StateObject private var viewModelbatch = BatchViewModel()

    @State private var isActive = false
    @State private var showAlert = false

    
    var body: some View {
        
        let batchCount = viewModelSave.savedProducts.count
       
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: Header
                VStack {
                    HStack {
                        Button(action: {
                            dismiss() // Navigates back
                        }) {
                            // Back Button Icon if needed
                        }
                        Text("Cart")
                            .font(.headline)
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image(systemName: "ellipsis")
                                .frame(width: 20, height: 20)
                        }
                    }
                    SearchBarView()
                }
                .padding(.horizontal)
                
                // MARK: Select All
                HStack {
                    Image(systemName: "checkmark.square")
                    Text("Select All")
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "highlighter")
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                .onAppear {
                    viewModelSave.loadProducts()
                    UserDefaults.standard.set(batchCount, forKey: "batchCount")
                    
                }
                
                
                // MARK: Product List
                if viewModelSave.savedProducts.isEmpty {
                    Text("No saved products yet.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    
                    var batchCount = viewModelSave.savedProducts.count
                    List(viewModelSave.savedProducts) { product in
                        HStack(alignment: .center, spacing: 12) {
                            Image(systemName: "checkmark.square")
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 100, height: 70)
                                
                                ProductImageView(imageUrl: product.image ?? "")
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(5)
                            }
                            
                            VStack(alignment: .leading, spacing: 30) {
                                Text(product.title ?? "")
                                    .font(.headline)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                
                                Text("₹\(product.price ?? 0, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 8) {
                                Button(action: { viewModel.decreaseQuantity(for: product) }) {
                                    Image(systemName: "minus.circle")
                                }
                                
                                Text("\(product.quantity ?? 0)")
                                    .frame(minWidth: 20)
                                
                                Button(action: { viewModel.increaseQuantity(for: product) }) {
                                    Image(systemName: "plus.circle")
                                }
                            }
                            .padding(.top, 50)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 16)
                        .listRowBackground(Color.white)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.white)
                }
                
                
                
                // MARK: Checkout Button
                Button(action: {
                    
                    showAlert = true
                    viewModelAlert.showSimpleAlert(
//                        title: "Cart",
                        message: "Thank You!",
                        okButtonText: "Ok",
                        okAction: {
                            
                           // viewModelSave.clearAll()
                        }
                    )
                    
                    
                    
                    
                    
                }) {
                    Text("Checkout")
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#C3E705"))
                        .foregroundColor(Color(hex: "#000000"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom,15)
                
                // MARK: Bottom Menu (After Checkout)
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Button(action: {
                            //dismiss()
                            
                            isActive = true

                            
                            
                        }) {
                            VStack {
                                Image(systemName: "house")
                                Text("Home").font(.caption2)
                            }
                            
                        }
                        
                    }
                    Spacer()
                    VStack(spacing: 4) {
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        Text("Catalog").font(.caption2)
                    }
                    Spacer()
                    
                    VStack(spacing: 4) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                                .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            
                            if batchCount > 0 {
                                
                                Text("\(batchCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: -8)
                            }
                        }
                        Text("Cart")
                            .font(.caption2)
                    }
                    
                    //                VStack(spacing: 4) {
                    //                    Image(systemName: "cart")
                    //                    Text("Cart").font(.caption2)
                    //                }
                    Spacer()
                    VStack(spacing: 4) {
                        Image(systemName: "heart")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        Text("Favorites").font(.caption2)
                    }
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: "person.circle")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        Text("Profile").font(.caption2)
                    }
                    Spacer()
                }
                .padding(.vertical,-10)
                .padding()
                //.background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                .padding(.horizontal,-40)
                //.padding(.bottom, 8)
                
            }
        }
        .alert(item: $viewModelAlert.commonAlert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: alert.primaryButton,
                secondaryButton: alert.secondaryButton ?? .default(Text("Cancel"))
            )
        }
        
        NavigationLink(destination: HomeView(), isActive: $isActive) {
            //HomeView()
                       }
        .background(Color.white.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
       
    }
    
    
}



//// MARK: - View
//struct CartView: View {
//    
//    @StateObject private var viewModel = CartViewModel()
//    @ObservedObject var viewModelSave: ProductStorageViewModel
//    @Environment(\.dismiss) private var dismiss
//    
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            VStack {
//                HStack {
//                    Button(action: {
//                        dismiss() // Navigates back
//                    }) {
////                        Image(systemName: "chevron.left")
////                            .foregroundColor(.black)
//                        
//                        
//                    }
//                    Text("Cart")
//                        .font(.headline)
//                    Spacer()
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 25)
//                            .fill(Color.gray.opacity(0.1))
//                            .frame(width: 50, height: 50)
//                        Image(systemName: "ellipsis")
//                            .frame(width: 20, height: 20)
//                        
//                    }
//                    
//                    
//                }
//                
//                SearchBarView()
//            }
//            //            .background(Color.gray.opacity(0.1))
//            .padding(.horizontal)
//            
//            HStack{
//                Image(systemName: "checkmark.square")
//                Text("Select All")
//                Spacer()
//                Image(systemName: "square.and.arrow.up")
//                Image(systemName: "highlighter")
//            }
//            .padding(.vertical)
//            .padding(.horizontal)
//            
//            if viewModelSave.savedProducts.isEmpty {
//                Text("No saved products yet.")
//                    .foregroundColor(.gray)
//                    .padding()
//            } else {
//                
//                List(viewModelSave.savedProducts) { product in
//                    HStack(alignment: .center, spacing: 12) {
//                        Image(systemName: "checkmark.square")
//                        
//                        
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(Color.gray.opacity(0.1))
//                                .frame(width: 100, height: 70)
//                            
//                            ProductImageView(imageUrl: product.image ?? "")
//                                .scaledToFit()
//                                .frame(width: 40, height: 40)
//                                .cornerRadius(5)
//                        }
//                        
//                        VStack(alignment: .leading, spacing: 30) {
//                            Text(product.title ?? "")
//                                .font(.headline)
//                                .lineLimit(1)
//                                .truncationMode(.tail)
//                            
//                            Text("₹\(product.price ?? 0, specifier: "%.2f")")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        
//                        HStack(spacing: 8) {
//                            Button(action: { viewModel.decreaseQuantity(for: product) }) {
//                                Image(systemName: "minus.circle")
//                            }
//                            
//                            Text("\(product.quantity ?? 0)")
//                                .frame(minWidth: 20)
//                            
//                            Button(action: { viewModel.increaseQuantity(for: product) }) {
//                                Image(systemName: "plus.circle")
//                            }
//                        }
//                        .padding(.top, 50)
//                    }
//                    .padding(.vertical, 6)
//                    .padding(.horizontal, 16)
//                    .listRowBackground(Color.white) // Ensure row background matches overall view
//                }
//                .listStyle(PlainListStyle())
//                .background(Color.white) // Background of list
//            }
//            
//            //Spacer()
//            Button(action: {}) {
//                Text("Checkout")
//                    .font(.system(size: 15, weight: .bold))
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color(hex: "#C3E705"))
//                    .foregroundColor(Color(hex: "#000000"))
//                    .cornerRadius(10)
//            }
//            .padding()
//            
//            
//            
//        }
//        
//        .background(Color.white.ignoresSafeArea()) // Main background color
//        .navigationBarBackButtonHidden(true) // <--- Hide back button here
//        
//    }
//}



//#Preview {
//    CartView(viewModelSave: View)
//}
