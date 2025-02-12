//
//  SettingsViewModel.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
   @Published var itemModel: [ItemModel] = []

   init() {

   }
   
   func setupSettingsItems() -> [ItemModel] {
      [
         ItemModel(title: "Rate Us", link: "https://github.com/ffdossa"),
         ItemModel(title: "Share App", link: "https://github.com/ffdossa"),
         ItemModel(title: "Contact Us", link: "https://github.com/ffdossa"),
         ItemModel(title: "Restore Purchases", link: "https://github.com/ffdossa"),
         ItemModel(title: "Privacy Policy", link: "https://github.com/ffdossa"),
         ItemModel(title: "Terms of Use", link: "https://github.com/ffdossa")
      ]
   }
}
