//
//  ChangeSpeakScreenView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//

import SwiftUI

struct ChangeSpeakScreenView: View {
   @State private var toShowResult = false
   @State private var resultType: ResultType? = nil
   @State private var isShowingFirstView = true

   var body: some View {
      VStack {
         if isShowingFirstView {
            HumanView(swapAction: swapScreens)
               .transition(.slide)
         } else {
            PetView(swapAction: swapScreens)
               .transition(.slide)
         }
      }
      .animation(.default, value: isShowingFirstView)
   }
   private func swapScreens() {
      isShowingFirstView.toggle()
   }
}

struct TextSwapButton: View {
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

struct SwapButton: View {
   var action: () -> Void

   var body: some View {
      Button(action: action) {
         Image("arrow-swap-horizontal")
      }
   }
}


#Preview {
   ChangeSpeakScreenView()
}
