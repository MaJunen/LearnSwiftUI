//
//  SheetRestaurantDetailView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/24.
//

import SwiftUI

struct SheetRestaurantDetailView: View {
    let restaurant: BottomSheetRestaurant
    
    var body: some View {
        VStack {
            Spacer()
//            HandleBar()
            ScrollView(.vertical) {
                TitleBar()
                SheetHeaderView(restaurant: restaurant)
                SheetDetailInfoView(icon: "map", info: restaurant.location)
                SheetDetailInfoView(icon: "phone", info: restaurant.phone)
                SheetDetailInfoView(icon: nil, info: restaurant.description)
                    .padding(.top)
            }
        }
        .background(.white)
        .cornerRadius(10, antialiased: true)
    }
}

#Preview {
    SheetRestaurantDetailView(restaurant: sheetRestaurants[0])
}

struct SheetDetailInfoView: View {
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SheetHeaderView: View {
    let restaurant: BottomSheetRestaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .foregroundStyle(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundStyle(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                        Spacer()
                    }
                    .padding()
                }
            }
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundStyle(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
        }
        .padding()
    }
}
