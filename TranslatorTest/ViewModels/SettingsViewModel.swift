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
         ItemModel(title: "Rate Us", link: "https://github.com/ffdossa/TranslatorTest"),
         ItemModel(title: "Share App", link: "https://github.com/ffdossa/TranslatorTest"),
         ItemModel(title: "Contact Us", link: "https://github.com/ffdossa/TranslatorTest"),
         ItemModel(title: "Restore Purchases", link: "https://github.com/ffdossa/TranslatorTest"),
         ItemModel(title: "Privacy Policy", link: "https://github.com/ffdossa/TranslatorTest"),
         ItemModel(title: "Terms of Use", link: "https://github.com/ffdossa/TranslatorTest")
      ]
   }
}
