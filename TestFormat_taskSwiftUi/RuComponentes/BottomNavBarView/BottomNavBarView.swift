//
//  BottomNavBarView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

import SwiftUI


struct BottomNavBarView: View {
    @StateObject private var viewModelDataSave = ProductStorageViewModel()
    @State private var reloadCartTrigger = false // 👈 state to trigger refresh
    let savedBatchCount = UserDefaults.standard.integer(forKey: "batchCount")


    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Bottom Navigation
                HStack {
                    Spacer()
                    
                    navItem(icon: "house.fill", label: "Home", destination: CartView(viewModelSave: viewModelDataSave))
                    
                    Spacer()
                    
//                    navItem(icon: "magnifyingglass.circle", label: "Catalog", destination: CartView(viewModelSave: viewModelDataSave))
                    VStack(spacing: 4) {
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                        Text("Catalog").font(.caption2)
                    }
                    
                    Spacer()
                    
                    
                    
                   
                    VStack(spacing: 4) {
                        ZStack(alignment: .topTrailing) {
                            navItem(icon: "cart", label: "Cart", destination: CartView(viewModelSave: viewModelDataSave))
                            
                           if savedBatchCount > 0 {
                                
                                Text("\(savedBatchCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: -8)
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    
//                    navItem(icon: "heart", label: "Favorites", destination: CartView(viewModelSave: viewModelDataSave))
                    VStack(spacing: 4) {
                        Image(systemName: "heart")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                        Text("Favorites").font(.caption2)
                    }
                    
                    Spacer()
                    
//                    navItem(icon: "person.circle", label: "Profile", destination: CartView(viewModelSave: viewModelDataSave))
                    VStack(spacing: 4) {
                        Image(systemName: "person.circle")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                        Text("Profile").font(.caption2)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 10)
                //.background(Color(.systemGray6))
            }
            .padding(.horizontal,-40)
        }
    }

    // Reusable nav item
    @ViewBuilder
    func navItem<Destination: View>(icon: String, label: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(.primary)
        }
    }
}


//struct BottomNavBarView: View {
//    @StateObject private var viewModelDataSave = ProductStorageViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                
//                
//                Spacer()
//                
//                HStack {
//                    Spacer()
//                    navItem(icon: "house.fill", label: "Home", destination: CartView(viewModelSave: viewModelDataSave))
//                    
//                    Spacer()
//                    navItem(icon: "cart.fill", label: "Cart", destination: CartView(viewModelSave: viewModelDataSave))
//                    
//                    Spacer()
//                    navItem(icon: "heart.fill", label: "Favorites", destination: CartView(viewModelSave: viewModelDataSave))
//                    
//                    Spacer()
//                    navItem(icon: "person.fill", label: "Profile", destination: CartView(viewModelSave: viewModelDataSave))
//                    
//                    Spacer()
//                    navItem(icon: "person.fill", label: "Account", destination: CartView(viewModelSave: viewModelDataSave))
//                    
//                    Spacer()
//                }
//                .padding(.top, 20)
//                .background(Color(.systemGray6))
//            }
//        }
//    }
//    
//    // Reusable nav item
//    @ViewBuilder
//    func navItem<Destination: View>(icon: String, label: String, destination: Destination) -> some View {
//        NavigationLink(destination: destination) {
//            VStack {
//                Image(systemName: icon)
//                    .font(.system(size: 20))
//                Text(label)
//                    .font(.caption)
//            }
//            .foregroundColor(.primary)
//        }
//    }
//}

struct AfeItem: View {
    let systemName: String
    let label: String

    var body: some View {
        VStack {
            Image(systemName: systemName)
            Text(label)
                .font(.caption)
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
