//
//  ContentView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct MainView: View {
  @State private var tabSelected = 1

  var body: some View {
    NavigationView {
      TabView(selection: $tabSelected) {
        TranslatorView()
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
  MainView()
}
