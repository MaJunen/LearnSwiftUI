//
//  SwiftUINavigationList.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SwiftUINavigationList: View {
    
    init() {
        // 修改导航栏属性
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.red, .font: UIFont(name: "ArialROundedMTBold", size: 35)!
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.red, .font: UIFont(name: "ArialROundedMTBold", size: 20)!
        ]
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var restaurants = [
        RestaurantNavigation(name: "Cafe Deadend", image: "cafedeadend"),
       RestaurantNavigation(name: "Homei", image: "homei"),
       RestaurantNavigation(name: "Teakha", image: "teakha"),
       RestaurantNavigation(name: "Cafe Loisl", image: "cafeloisl"),
       RestaurantNavigation(name: "Petite Oyster", image: "petiteoyster"),
       RestaurantNavigation(name: "For Kee Restaurant", image: "forkeerestaurant"),
       RestaurantNavigation(name: "Po's Atelier", image: "posatelier"),
       RestaurantNavigation(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
       RestaurantNavigation(name: "Haigh's Chocolate", image: "haighschocolate"),
       RestaurantNavigation(name: "Palomino Espresso", image: "palominoespresso"),
       RestaurantNavigation(name: "Homei", image: "upstate"),
       RestaurantNavigation(name: "Traif", image: "traif"),
       RestaurantNavigation(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
       RestaurantNavigation(name: "Waffle & Wolf", image: "wafflewolf"),
       RestaurantNavigation(name: "Five Leaves", image: "fiveleaves"),
       RestaurantNavigation(name: "Cafe Lore", image: "cafelore"),
       RestaurantNavigation(name: "Confessional", image: "confessional"),
       RestaurantNavigation(name: "Barrafina", image: "barrafina"),
       RestaurantNavigation(name: "Donostia", image: "donostia"),
       RestaurantNavigation(name: "Royal Oak", image: "royaloak"),
       RestaurantNavigation(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: NavigationRestaurantDetailView(restaurant: restaurant)) {
                        BasicImageRowNavigation(restaurant: restaurant)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
        }
        // 设置返回按钮颜色
        .tint(.black)
    }
}

struct RestaurantNavigation: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImageRowNavigation: View {
    var restaurant: RestaurantNavigation
    
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

#Preview {
    SwiftUINavigationList()
}
