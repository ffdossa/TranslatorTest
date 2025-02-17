//
//  ChangeSpeakScreenView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 11.02.2025.
//

import SwiftUI

struct TypeResultButton: View {
   @State var resultType: ResultType
   
   var action: () -> Void
   
   var body: some View {
      Button {
         action()
      } label: {
         Image("arrow-swap-horizontal")
      }
   }
}

struct SwapButtonImage: View {
   var firstImage: Image
   var secondImage: Image
   var firstColor: Color
   var secondColor: Color
   
   var body: some View {
      HStack(spacing: 100) {
         ZStack {
            Circle()
               .frame(width: 70, height: 70)
               .foregroundStyle(firstColor)
            
            firstImage
               .resizable()
               .frame(width: 36, height: 36)
         }
         
         ZStack {
            Circle()
               .frame(width: 70, height: 70)
               .foregroundStyle(secondColor)
            
            secondImage
               .resizable()
               .frame(width: 36, height: 36)
         }
      }
      .animation(.bouncy)
   }
}

struct SwapImage: View {
   @State var resultType: ResultType
   
   var image: Image
   
   var body: some View {
      image
         .resizable()
         .frame(width: 184, height: 184)
   }
}


