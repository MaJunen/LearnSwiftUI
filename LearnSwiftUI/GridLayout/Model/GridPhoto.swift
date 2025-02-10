//
//  GridPhoto.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import Foundation

struct GridPhoto: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map { GridPhoto(name: "coffee-\($0)") }
