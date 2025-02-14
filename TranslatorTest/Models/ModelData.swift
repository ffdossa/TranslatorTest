//
//  ModelData.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//


import Foundation

struct ItemModel: Identifiable {
   let id = UUID()
   var title: String
   var link: String
}

struct Template: Identifiable, Codable {
   let humanResult: String
   let petResult: String
   let id: Int
}

class ModelData: ObservableObject {
   @Published var templates: [Template] = []
   @Published var randomText: String = ""

   init() {
      loadData()
   }

   func loadData() {
      guard let url = Bundle.main.url(forResource: "translatorData", withExtension: "json") else {
         print("JSON file not found.")
         return
      }

      do {
         let data = try Data(contentsOf: url)
         let decodedData = try JSONDecoder().decode([Template].self, from: data)
         DispatchQueue.main.async {
            self.templates = decodedData
         }
      } catch {
         print("JSON parsing error: \(error.localizedDescription)")
      }
   }

   func loadRandomResult(for type: ResultType) {
      guard !templates.isEmpty else { return }
      let randomTemplate = templates.randomElement()!

      switch type {
      case .human:
         randomText = randomTemplate.humanResult
      case .pet:
         randomText = randomTemplate.petResult
      }
   }
}
