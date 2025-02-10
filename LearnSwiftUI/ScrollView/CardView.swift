//
//  CardView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/27.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB ,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                )
                .padding([.top, .horizontal])
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                    Text("Written by \(author)".uppercased())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
}
