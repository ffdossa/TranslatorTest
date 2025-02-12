//
//  ItemModel.swift
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
