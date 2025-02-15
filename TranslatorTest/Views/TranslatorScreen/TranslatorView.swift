//
//  TranslatorView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI


struct TranslatorView: View {
   @StateObject var viewModel = TranslatorViewModel()
   @State private var resultTypeHuman: ResultType = .human
   @State private var resultTypePet: ResultType = .pet
   @State private var isShowingResult = false

   var body: some View {
      NavigationView {
         VStack {
            VStack(spacing: 90) {
               ZStack(alignment: .center) {
                  isShowingResult ?
                  TopResultButtonView(resultType: $resultTypeHuman) {
                     isShowingResult.toggle()
                  } :
                  TopResultButtonView(resultType: $resultTypePet) {
                     isShowingResult.toggle()
                  }

                  isShowingResult ?
                  TextSwapButton(textFirst: "HUMAN", textSecond: "PET")
                     .padding(.trailing, 30) :
                  TextSwapButton(textFirst: "PET", textSecond: "HUMAN")
                     .padding(.leading, 30)
               }

               HStack(spacing: 30) {
                  isShowingResult ? RecordingView(resultType: $resultTypeHuman) : RecordingView(resultType: $resultTypePet)

                  ZStack {
                     RoundedRectangle(cornerRadius: 16)
                        .frame(width: 107, height: 176)
                        .foregroundStyle(Color.white)
                     VStack {
                        TrailingResultButtonView(resultType: $resultTypeHuman, image: Types.Images.human, color: Style.Colors.catBackgroundColor) {
                           isShowingResult = true
                        }

                        TrailingResultButtonView(resultType: $resultTypePet, image: Types.Images.pet, color: Style.Colors.dogBackgroundColor) {
                           isShowingResult = false
                        }
                     }
                  }
               }
            }
            Spacer()

            isShowingResult ? SwapImage(resultType: $resultTypeHuman, image: Types.Images.human) : SwapImage(resultType: $resultTypePet, image: Types.Images.pet)

            Spacer()
         }
         .toolbar {
            ToolbarItem(placement: .principal) {
               Text("Translator")
                  .font(.largeTitle)
                  .bold()
            }
         }
         .frame(maxWidth: .greatestFiniteMagnitude,
                maxHeight: .greatestFiniteMagnitude)

         .foregroundStyle(Style.Colors.basicColor)

         .background(
            .linearGradient(Style.Colors.gradientColor,
                            startPoint: .top,
                            endPoint: .bottom))
      }
   }
}

#Preview {
   TranslatorView()
}
