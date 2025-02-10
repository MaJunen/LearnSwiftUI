//
//  SwiftUIFormView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SwiftUIFormView: View {
    @State var restaurantForms = [
        RestaurantForm(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        RestaurantForm(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        RestaurantForm(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        RestaurantForm(name: "For Kee RestaurantForm", type: "Hong Kong", phone: "232-434222", image: "bourkestreetbakery", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        RestaurantForm(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        RestaurantForm(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        RestaurantForm(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        RestaurantForm(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        RestaurantForm(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        RestaurantForm(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
        RestaurantForm(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        RestaurantForm(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        RestaurantForm(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        RestaurantForm(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        RestaurantForm(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        RestaurantForm(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
        ]
    

    @State private var selectedRestaurantForm: RestaurantForm?
    @State private var showSettings = false
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurantForms.sorted(by: self.settingStore.displayOrder.predicate())) { restaurantForm in
                    if self.shouldShowItem(restaurant: restaurantForm) {
                        BasicImageRowForm(restaurant: restaurantForm)
                            .contextMenu {
                                
                                Button(action: {
                                    // mark the selected RestaurantForm as check-in
                                    self.checkIn(item: restaurantForm)
                                }) {
                                    HStack {
                                        Text("Check-in")
                                        Image(systemName: "checkmark.seal.fill")
                                    }
                                }
                                
                                Button(action: {
                                    // delete the selected RestaurantForm
                                    self.delete(item: restaurantForm)
                                }) {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                                                 
                                Button(action: {
                                    // mark the selected RestaurantForm as favorite
                                    self.setFavorite(item: restaurantForm)
                                    
                                }) {
                                    HStack {
                                        Text("Favorite")
                                        Image(systemName: "star")
                                    }
                                }
                            }
                            .onTapGesture {
                                self.selectedRestaurantForm = restaurantForm
                            }
                    }
                }
                // 左滑删除
                .onDelete { (indexSet) in
                    self.restaurantForms.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("RestaurantForm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.showSettings = true
                    }, label: {
                        Image(systemName: "gear").font(.title2)
                    })
                    .tint(.black)
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingFormView().environmentObject(self.settingStore)
            }
        }
    }
    
    private func delete(item RestaurantForm: RestaurantForm) {
        if let index = self.restaurantForms.firstIndex(where: { $0.id == RestaurantForm.id }) {
            self.restaurantForms.remove(at: index)
        }
    }
    
    private func setFavorite(item RestaurantForm: RestaurantForm) {
        if let index = self.restaurantForms.firstIndex(where: { $0.id == RestaurantForm.id }) {
            self.restaurantForms[index].isFavorite.toggle()
        }
    }
    
    private func checkIn(item RestaurantForm: RestaurantForm) {
        if let index = self.restaurantForms.firstIndex(where: { $0.id == RestaurantForm.id }) {
            self.restaurantForms[index].isCheckIn.toggle()
        }
    }
    
    private func shouldShowItem(restaurant: RestaurantForm) -> Bool {
        return (!self.settingStore.showCheckInOnly || restaurant.isCheckIn) && (restaurant.priceLevel <= self.settingStore.maxPriceLevel)
    }
}

struct RestaurantForm: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicImageRowForm: View {
    var restaurant: RestaurantForm
    
    var body: some View {
      
            HStack {
                Image(restaurant.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(restaurant.name)
                            .font(.system(.body, design: .rounded))
                            .bold()
                        
                        Text(String(repeating: "$", count: restaurant.priceLevel))
                            .font(.subheadline)
                            .foregroundColor(.gray)

                    }
                    
                    Text(restaurant.type)
                        .font(.system(.subheadline, design: .rounded))
                        .bold()
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    Text(restaurant.phone)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                    .layoutPriority(-100)
                
                if restaurant.isCheckIn {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.red)
                }
                
                if restaurant.isFavorite {
//                    Spacer()
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }
            }
            
        
    }
}

#Preview {
    SwiftUIFormView().environmentObject(SettingStore())
}
