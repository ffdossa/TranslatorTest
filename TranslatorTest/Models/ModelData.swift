//
//  ModelData.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//


import Foundation

struct Template: Identifiable, Codable {
    let humanResult: String
    let catResult: String
    let dogResult: String
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
            let petResult = Bool.random() ? randomTemplate.dogResult : randomTemplate.catResult
            randomText = petResult
        }
    }
}
