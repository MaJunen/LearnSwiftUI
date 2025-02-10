//
//  TinderTripCardView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/24.
//

import SwiftUI

struct BottomBarMenu: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundStyle(.black)
            Button {
                
            } label: {
                Text("BOOK IT NOW")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .background(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundStyle(.black)
        }
    }
}

struct TopBarMenu: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 35))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
        }
        .padding()
    }
}

struct TinderTripCardView: View, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            .overlay(alignment: .bottom) {
                VStack {
                    Text(title)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal, 39)
                        .padding(.vertical, 10)
                        .background(.white)
                        .cornerRadius(5)
                }
                .padding()
            }
    }
}

#Preview {
    TinderTripCardView(image: "yosemite-usa", title: "Yosemite, USA")
}
