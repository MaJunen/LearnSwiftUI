//
//  SearchBar.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/6.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        // 停止自动大写
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search..."
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    // 更新视图配置
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
}

class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    
    init(_ text: Binding<String>) {
        self._text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        text = searchText
        
        print("textDidChange: \(text)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
}

#Preview {
    SearchBar(text: .constant("123"))
}
