//
//  SwiftUIBottomSheetView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/24.
//

import SwiftUI

struct SwiftUIBottomSheetView: View {
    @State private var selectedRestaurant: BottomSheetRestaurant?
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sheetRestaurants) { restaurant in
                    BasicSheetImageRow(restaurant: restaurant)
                        .onTapGesture {
                            selectedRestaurant = restaurant
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .sheet(item: $selectedRestaurant) { restaurant in
                SheetRestaurantDetailView(restaurant: restaurant)
                    .ignoresSafeArea()
                    // 四种尺寸:大约屏幕高度的10%，固定高度200,中，大
                    // selection:初始化打开的位置
                    .presentationDetents([.fraction(0.1), .height(200) ,.medium, .large], selection: $selectedDetent)
            }
        }
    }
}

#Preview {
    SwiftUIBottomSheetView()
}

struct BasicSheetImageRow: View {
    var restaurant: BottomSheetRestaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}
