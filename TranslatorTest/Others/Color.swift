//
//  Color.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 12.02.2025.
//

import Foundation
import SwiftUI

enum Style {
   enum Colors {
      static let basicColor = Color.init(hexString: "#292D32")
      static let humanBackgroundColor = Color.init(hexString: "#D1E7FC")
      static let petBackgroundColor = Color.init(hexString: "#ECFBC7")
      static let gradientColor = Gradient(colors: [
            Color.init(hexString: "#F3F5F6"),
            Color.init(hexString: "#C9FFE0")])

   }
}
