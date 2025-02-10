//
//  SwiftUIActionSheetView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/21.
//

import SwiftUI

struct SwiftUIActionSheetView: View {
    @State var restaurants = [
        RestaurantActionSheet(name: "Cafe Deadend", image: "cafedeadend"),
        RestaurantActionSheet(name: "Homei", image: "homei"),
        RestaurantActionSheet(name: "Teakha", image: "teakha"),
        RestaurantActionSheet(name: "Cafe Loisl", image: "cafeloisl"),
        RestaurantActionSheet(name: "Petite Oyster", image: "petiteoyster"),
        RestaurantActionSheet(name: "For Kee Restaurant", image: "forkeerestaurant"),
        RestaurantActionSheet(name: "Po's Atelier", image: "posatelier"),
        RestaurantActionSheet(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        RestaurantActionSheet(name: "Haigh's Chocolate", image: "haighschocolate"),
        RestaurantActionSheet(name: "Palomino Espresso", image: "palominoespresso"),
        RestaurantActionSheet(name: "Homei", image: "upstate"),
        RestaurantActionSheet(name: "Traif", image: "traif"),
        RestaurantActionSheet(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        RestaurantActionSheet(name: "Waffle & Wolf", image: "wafflewolf"),
        RestaurantActionSheet(name: "Five Leaves", image: "fiveleaves"),
        RestaurantActionSheet(name: "Cafe Lore", image: "cafelore"),
        RestaurantActionSheet(name: "Confessional", image: "confessional"),
        RestaurantActionSheet(name: "Barrafina", image: "barrafina"),
        RestaurantActionSheet(name: "Donostia", image: "donostia"),
        RestaurantActionSheet(name: "Royal Oak", image: "royaloak"),
        RestaurantActionSheet(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    @State private var selectedRestaurant: RestaurantActionSheet?

    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageActionSheetRow(restaurant: restaurant)
                    .contextMenu {
                        Button {
                            // 删除所选的餐厅
                            self.delete(item: restaurant)
                        } label: {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                        Button {
                            // 将所选餐厅标记为最爱
                            self.setFavorite(item: restaurant)
                        } label: {
                            HStack {
                                Text("Favorite")
                                Image(systemName: "star")
                            }
                        }
                        Button {
                            // 打卡 checkmark.seal.fill
                            self.setCheckIn(item: restaurant)
                        } label: {
                            Text("Check-in")
                            Image(systemName: "checkmark.seal.fill")
                        }

                    }
                    .onTapGesture {
                        self.selectedRestaurant = restaurant
                    }
                    .actionSheet(item: $selectedRestaurant) { selectedRestaurant in
                        ActionSheet(title: Text("What do you want to do"), message: nil, buttons: [
                            .default(Text("Mark as Favorite"), action: {
                                self.setFavorite(item: selectedRestaurant)
                            }),
                            .destructive(Text("Delete"), action: {
                                self.delete(item: selectedRestaurant)
                            }),
                            .cancel()
                        ])
                    }
            }
            // 左滑删除
            .onDelete { (indexSet) in
                self.restaurants.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.plain)
    }
 
    private func delete(item restaurant: RestaurantActionSheet) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: RestaurantActionSheet) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
    
    private func setCheckIn(item restaurant: RestaurantActionSheet) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
}

struct RestaurantActionSheet: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicImageActionSheetRow: View {
    var restaurant: RestaurantActionSheet
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.red)
            }
            
            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}


#Preview {
    SwiftUIActionSheetView()
}
