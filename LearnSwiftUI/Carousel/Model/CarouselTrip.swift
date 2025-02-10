//
//  CarouselTrip.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import Foundation

struct CarouselTrip: Identifiable {
    var id = UUID()
    var destination: String
    var image: String
}


let sampleTrips = [ CarouselTrip(destination: "Paris", image: "paris"),
                    CarouselTrip(destination: "Florence", image: "florence"),
                    CarouselTrip(destination: "Amsterdam", image: "amsterdam"),
                    CarouselTrip(destination: "Ghent", image: "ghent"),
                    CarouselTrip(destination: "Santorini", image: "santorini"),
                    CarouselTrip(destination: "Budapest", image: "budapest"),
                    CarouselTrip(destination: "London", image: "london"),
                    CarouselTrip(destination: "Cuba", image: "cuba"),
                    CarouselTrip(destination: "Osaka", image: "osaka"),
                    CarouselTrip(destination: "Kyoto", image: "kyoto"),
                    CarouselTrip(destination: "Seoul", image: "seoul"),
                    CarouselTrip(destination: "Sydney", image: "sydney"),
                    CarouselTrip(destination: "Hong Kong", image: "hongkong")
]

