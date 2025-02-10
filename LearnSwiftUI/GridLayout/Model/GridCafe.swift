//
//  GridCafe.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import Foundation

struct GridCafe: Identifiable {
    var id = UUID()
    var image: String
    var coffeePhotos: [GridPhoto] = []
}

let sampleCafes: [GridCafe] = {
    var cafes = (1...18).map { GridCafe(image: "cafe-\($0)") }
    
    for index in cafes.indices {
        let randomNumber = Int.random(in: (2...12))
        cafes[index].coffeePhotos = (1...randomNumber).map { GridPhoto(name: "coffee-\($0)") }
    }
    
    return cafes
}()
