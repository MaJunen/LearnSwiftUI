//
//  LearnSwiftUIApp.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/24.
//

import SwiftUI
import SwiftData

@main
struct LearnSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PaymentActivity.self)
        .modelContainer(for: ToDoItem.self)
    }
}
