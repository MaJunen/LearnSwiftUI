//
//  SwiftUIList.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/13.
//

import SwiftUI

struct SwiftUIList: View {
    
    var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Homei", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),
        Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        // indices: Array -> Range
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                if (0...1).contains(index) {
                    FullImageRow(restaurant: self.restaurants[index])
                } else {
                    BasicImageRow(restaurant: self.restaurants[index])
                }
            }
            //更改分隔符
            .listRowSeparatorTint(.green)
            .listRowSeparator(.hidden)
        }
//        .listStyle(.plain)
        // 自定义可滚动区域颜色
//        .background(.yellow)
        .background {
            Image("homei")
                .resizable()
                .scaledToFill()
                .clipped()
                .ignoresSafeArea()
        }
        .scrollContentBackground(.hidden)
    }
}

// 当Restaurant遵循Identifiable协议时，可以不使用id来初始化List
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

#Preview {
    SwiftUIList()
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
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

struct FullImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay {
                    Rectangle()
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                }
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.white)
        }
    }
}
