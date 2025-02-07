//
//  ContentView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelected) {
                MainView()
                    .tag(1)
                
                SettingsView()
                    .tag(2)
            }
            .overlay(alignment: .bottom) {
                TabBarView(tabSelected: $tabSelected)
            }
        }
    }
}


#Preview {
    ContentView()
}
