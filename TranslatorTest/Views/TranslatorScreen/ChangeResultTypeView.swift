//
//  ChangeSpeakScreenView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//

import SwiftUI


struct ChangeResultTypeView: View {
   @Binding var resultType: ResultType

   var action: () -> Void

   var body: some View {
         Button {
            action()
         } label: {
            Image("arrow-swap-horizontal")
         }
   }
}

struct TextSwapButton: View {
   @Binding var resultType: ResultType

   var textFirst: String
   var textSecond: String

   var body: some View {
      HStack(spacing: 128) {
         Text(textFirst)
            .bold()

         Text(textSecond)
            .bold()
      }
   }
}

