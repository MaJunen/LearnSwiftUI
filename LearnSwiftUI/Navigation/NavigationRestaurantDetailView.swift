//
//  NavigationRestaurantDetailView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct NavigationRestaurantDetailView: View {
    // iOS15以下使用presentationMode，以上使用dismiss
    // 然后使用presentationMode.wraooerdValue.dismiss()返回
    @Environment(\.dismiss) var dismiss
    
    var restaurant: RestaurantNavigation
    
    var body: some View {
        
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                        .foregroundStyle(.black)
                }
            }
        }
        
    }
}

#Preview {
    NavigationRestaurantDetailView(restaurant: RestaurantNavigation(name: "CASK Pub and Kitchen", image: "caskpubkitchen"))
}
