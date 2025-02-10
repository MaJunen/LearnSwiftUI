//
//  SettingFormView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SettingFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) {
                            Text($0.text)
                        }
                    } label: {
                        Text("Display Order")
                    }
                } header: {
                    Text("SORT PREFERENCE")
                }
                
                Section {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in Only")
                    }
                    
                    Stepper("Show \(String(repeating: "$", count: maxPriceLevel)) or below") {
                        self.maxPriceLevel += 1
                        if self.maxPriceLevel > 5 {
                            self.maxPriceLevel = 5
                        }
                    } onDecrement: {
                        self.maxPriceLevel -= 1
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    }
                } header: {
                    Text("FILTER PREFERENCE")
                }
            }
            .navigationTitle("Setting")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.settingStore.showCheckInOnly = self.showCheckInOnly
                        self.settingStore.displayOrder = self.selectedOrder
                        self.settingStore.maxPriceLevel = self.maxPriceLevel
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundStyle(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .onAppear() {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}

#Preview {
    SettingFormView().environmentObject(SettingStore())
}
