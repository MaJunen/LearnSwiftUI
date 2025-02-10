//
//  ToDoListView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/5.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) private var modelContext
    // Query查询，sort排序
    @Query(sort: \ToDoItem.priorityNum, order: .reverse) var todoItems: [ToDoItem]
    @State private var searchText = ""
    
    @State private var newItemName: String = ""
    @State private var newItemPriority: Priority = .normal
    
    @State private var showNewTask = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("ToDo List")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                    Spacer()
                    
                    Button {
                        self.showNewTask = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.purple)
                    }
                }
                .padding()
                
//                SearchBar(text: $searchText)
                SearchBarCustom(text: $searchText)
                    .padding(.top, -20)
                
                List {
                    ForEach(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { todoItem in
                        ToDoListRow(todoItem: todoItem)
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
            }
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewTask ? -50 : 0)
            .animation(.easeOut, value: showNewTask)
            .onAppear() {
                UITableView.appearance().separatorColor = .clear
            }
            
            if todoItems.count == 0 {
                NoDataView()
            }
            
            if showNewTask {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        showNewTask = false
                    }
                
                NewToDoView(isShow: $showNewTask, name: "", priority: .normal)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: showNewTask)
            }
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = todoItems[index]
            modelContext.delete(itemToDelete)
        }
    }
}

struct NoDataView: View {
    var body: some View {
        Image("welcome")
            .resizable()
            .scaledToFit()
    }
}

struct BlankView: View {
    
    var bgColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ToDoListView()
        .modelContainer(previewContainer)
}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: ToDoItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        for index in 0..<10 {
            let newItem = ToDoItem(name: "To do Item #\(index)")
            container.mainContext.insert(newItem)
        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
