//
//  Extensions.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI
import UIKit


extension Color {

   init(hexString: String) {
      guard hexString.hasPrefix("#") else {
         self = .clear
         return
      }

      let hex = hexString.trimmingCharacters(in: .init(["#"]))

      var value = UInt32()
      Scanner(string: hex).scanHexInt32(&value)

      if hexString.count == 7 {
         value = value << 8
         value += 0xFF
         self.init(hex: value)
      } else if hexString.count == 9 {
         self.init(hex: value)
      } else {
         self = .clear
      }
   }

   init(hex: UInt32) {
      let r, g, b, a: Double

      r = Double((hex >> 24) & 0xFF) / 255.0
      g = Double((hex >> 16) & 0xFF) / 255.0
      b = Double((hex >> 8)  & 0xFF) / 255.0
      a = Double( hex        & 0xFF) / 255.0

      self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
   }
}
