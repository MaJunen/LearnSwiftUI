//
//  CarouselTripCardView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct CarouselTripCardView: View {
    let destination: String
    let imageName: String
    
    @Binding var isShowDetails: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(self.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(self.isShowDetails ? 0 : 15)
                    .overlay {
                        Text(self.destination)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(10)
                            .background(Color.white)
                            .padding([.bottom, .leading])
                            .opacity(self.isShowDetails ? 0.0 : 1.0)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    }
            }
        }
    }
}

#Preview {
    CarouselTripCardView(destination: sampleTrips[0].destination, imageName: sampleTrips[0].image, isShowDetails: .constant(true))
}
