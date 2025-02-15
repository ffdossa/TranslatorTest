//
//  ChangeSpeakScreenView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//

import SwiftUI


struct TopResultButtonView: View {
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

struct TrailingResultButtonView: View {
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
               .resizable()
               .frame(width: 36, height: 36)
         }
      }
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
      .animation(.easeInOut(duration: 0.5))
   }
}

struct SwapImage: View {
   @Binding var resultType: ResultType
   
   var image: Image

   var body: some View {
      image
         .resizable()
         .frame(width: 184, height: 184)
   }
}


