//
//  SwiftUITaskAnimationView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUITaskAnimationView: View {
    
    @State private var overallProgress = 0.0
    @State private var taskStore = [
        ProgressTask(name: "Design", progress: 0.7),
        ProgressTask(name: "Coding", progress: 0.5),
        ProgressTask(name: "Documentation", progress: 0.1),
        ProgressTask(name: "Unit Testing", progress: 0.2)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily Task")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .padding(.horizontal)
                .padding(.top)
            
            HStack {
                Text("Overall Progress")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                
                Spacer()
                
                SwiftUIProgressRingView(progress: $overallProgress, thickness: 12.0, width: 130.0, gradient: Gradient(colors: [.darkYellow, .lightYellow]), textColor: .white)
            }
            .padding(.all, 20)
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem()]) {
                ForEach(taskStore.indices, id: \.self) { index in
                    TaskProgressView(task: $taskStore[index])
                }
            }
            
            Spacer()
        }
        .onAppear() {
            self.overallProgress = taskStore.reduce(0) { $0 + $1.progress } / Double(taskStore.count)
        }
        .onChange(of: taskStore) { oldValue, newValue in
            self.overallProgress = taskStore.reduce(0) { $0 + $1.progress } / Double(taskStore.count)
        }
    }
}

struct TaskProgressView: View {
    @Binding var task: ProgressTask
    
    var sliderColor: Color = .lightOrange
    
    private var progressText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        return formatter.string(from: NSNumber(value: task.progress)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(task.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(progressText)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(Color.primary.opacity(0.8))
            }
            
            HStack {
                Text("0%")
                    .font(.system(.subheadline, design: .rounded))
                Slider(value: $task.progress, in: 0...1, step: 0.05)
                    .accentColor(sliderColor)
                Text("100%")
                    .font(.system(.subheadline, design: .rounded))
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .padding(.horizontal)
    }
}

#Preview {
    SwiftUITaskAnimationView()
}
