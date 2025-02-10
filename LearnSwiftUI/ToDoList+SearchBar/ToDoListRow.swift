//
//  ToDoListRow.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/5.
//

import SwiftUI

struct ToDoListRow: View {
    
    @Bindable var todoItem: ToDoItem
    
    var body: some View {
        Toggle(isOn: $todoItem.isComplete) {
            HStack {
                Text(todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(color(for: todoItem.priority))
            }
        }
        .toggleStyle(CheckboxStyle())
    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}

#Preview {
    ToDoListRow(todoItem: ToDoItem(name: "name", priority: .low, isComplete: true))
}
