//
//  ExpandableMenuView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import SwiftUI

struct ExpandableMenuView: View {
    
    var body: some View {
//        listMenu()
        outlineGroup()
    }
    
    private func outlineGroup() -> some View {
        List {
            ForEach(sampleMenuItems) { menuItem in
                Section(header:
                    HStack {
                        Text(menuItem.name)
                            .font(.title3)
                            .fontWeight(.heavy)
                        
                        Image(menuItem.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.vertical)
                ) {
                    OutlineGroup(menuItem.subMenuItems ?? [ExpandableMenuItem](), children: \.subMenuItems) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(item.name)
                                .font(.system(.title3, design: .rounded))
                                .bold()
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
    
    private func listMenu() -> some View {
        List(sampleMenuItems, children: \.subMenuItems) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text(item.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ExpandableMenuView()
}
