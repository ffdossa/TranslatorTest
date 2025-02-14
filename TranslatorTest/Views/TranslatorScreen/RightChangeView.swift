//
//  RightChangeView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 14.02.2025.
//

import SwiftUI

struct RightChangeView: View {
   @Binding var resultType: ResultType

   var image: Image
   var color: Color
   var action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         ZStack {
            RoundedRectangle(cornerRadius: 8)
               .frame(width: 70, height: 70)
               .foregroundStyle(color)

            image
         }
      }
   }
}

