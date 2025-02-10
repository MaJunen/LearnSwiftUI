//
//  NewToDoView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/5.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isShow: Bool
//    @Binding var todoItems: [ToDoItem]
    
    @State var name: String
    @State var priority: Priority
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Add a new task")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        isShow = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .font(.headline)
                    }
                }
                
                TextField("Enter the task description", text: $name) { editingChanged in
                    self.isEditing = editingChanged
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom)
                
                Text("Priority")
                    .font(.system(.subheadline, design: .rounded))
                    .padding(.bottom)
                
                HStack {
                    Text("High")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .high ? Color.red : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            priority = .high
                        }
                    
                    Text("Normal")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .normal ? Color.red : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            priority = .normal
                        }
                    
                    Text("Low")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .low ? Color.red : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            priority = .low
                        }
                }
                .padding(.bottom, 30)
                
                Button {
                    if name.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }
                    self.isShow = false
                    self.addTask(name: self.name, priority: self.priority)
                } label: {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .padding()
            .background(.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -320 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addTask(name: String, priority: Priority, isComplete: Bool = false) {
        let task = ToDoItem(name: name, priority: priority, isComplete: isComplete)
//        todoItems.append(task)
        modelContext.insert(task)
    }
}

#Preview {
    NewToDoView(isShow: .constant(true), name: "", priority: .low)
}
