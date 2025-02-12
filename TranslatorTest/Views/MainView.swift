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

            EmptyView()
               .tag(2)

            EmptyView()
               .tag(3)

            SettingsView()
               .tag(4)
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
