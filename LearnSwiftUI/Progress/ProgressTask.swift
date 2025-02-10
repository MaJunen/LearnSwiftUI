//
//  ProgressTask.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//
import Foundation

struct ProgressTask: Identifiable, Equatable {
    var id = UUID()
    var name: String = ""
    var progress: Double = 0.0 {
        didSet {
            progress = min(progress, 1.0)
        }
    }
    
    init(name: String, progress: Double = 0.0) {
        self.name = name
        self.progress = progress
    }
}

//class TaskStore: ObservableObject {
//    @Published var tasks = sampleProgressTasks
//}
//
//var sampleProgressTasks = [ ProgressTask(name: "Design", progress: 0.7),
//                    ProgressTask(name: "Coding", progress: 0.5),
//                    ProgressTask(name: "Documentation", progress: 0.1),
//                    ProgressTask(name: "Unit Testing", progress: 0.2)
//]
