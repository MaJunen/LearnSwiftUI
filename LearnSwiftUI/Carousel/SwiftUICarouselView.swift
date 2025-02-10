//
//  SwiftUICarouselView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct SwiftUICarouselView: View {
    @State private var isCardTapped = false
    @State private var currentTripIndex = 2
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
//        carouselExampleNotPage()
        ZStack {
            VStack(alignment: .leading) {
                Text("Discover")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text("Explore your next destination")
                    .font(.system(.headline, design: .rounded))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 25)
            .padding(.leading, 20)
            .opacity(self.isCardTapped ? 0.1 : 1.0)
            .offset(y: self.isCardTapped ? -100 : 0)
            
            GeometryReader { outerView in
                HStack(spacing: 0) {
                    ForEach(sampleTrips.indices, id: \.self) { index in
                        GeometryReader { innerView in
                            CarouselTripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: $isCardTapped)
                                .offset(y: self.isCardTapped ? -innerView.size.height * 0.3 : 0)
                        }
                        .padding(.horizontal, self.isCardTapped ? 0 : 20)
                        .frame(width: outerView.size.width, height: self.currentTripIndex == index ? (self.isCardTapped ? outerView.size.height : 450) : 400)
                        .opacity(self.currentTripIndex == index ? 1.0 : 0.7)
                        .onTapGesture {
                            withAnimation(.interpolatingSpring(.bouncy, initialVelocity: 0.3)) {
                                self.isCardTapped = true
                            }
                        }
                    }
                }
                .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                //一样道理
                .offset(x: -CGFloat(self.currentTripIndex) * outerView.size.width + self.dragOffset)
                //            .offset(x: self.dragOffset)
                .gesture(
                    !self.isCardTapped ?
                    DragGesture()
                        .updating($dragOffset, body: { value, state, transaction in
                            state = value.translation.width
                        })
                        .onEnded({ value in
                            let threshold = outerView.size.width * 0.65
                            var newIndex = Int(-value.translation.width / threshold) + self.currentTripIndex
                            newIndex = min(max(newIndex, 0), sampleTrips.count - 1)
                            self.currentTripIndex = newIndex
                        })
                    : nil
                )
            }
            .animation(.interpolatingSpring(.bouncy), value: dragOffset)
            
            if self.isCardTapped {
                CarouselTripDetailView(destination: sampleTrips[currentTripIndex].destination)
                    .offset(y: 200)
                    .transition(.move(edge: .bottom))
                
                Button {
                    withAnimation {
                        self.isCardTapped = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)
            }
        }
    }
    
    private func carouselExampleNotPage() -> some View {
        GeometryReader { outerView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(sampleTrips.indices, id: \.self) { index  in
                        GeometryReader { innerView in
                            CarouselTripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: $isCardTapped)
                        }
                        .padding(.horizontal, 20)
                        .frame(width: outerView.size.width, height: 450)
                    }
                }
            }
            .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
        }
    }
}

#Preview {
    SwiftUICarouselView()
}
