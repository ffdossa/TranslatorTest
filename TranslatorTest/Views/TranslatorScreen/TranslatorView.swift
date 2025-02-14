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
                  ChangeResultTypeView(resultType: $resultTypeHuman) {
                     isShowingResult.toggle()
                  } :
                  ChangeResultTypeView(resultType: $resultTypePet) {
                     isShowingResult.toggle()
                  }

                  isShowingResult ?
                  TextSwapButton(resultType: $resultTypeHuman, textFirst: "HUMAN", textSecond: "PET")
                     .padding(.trailing, 30) :
                  TextSwapButton(resultType: $resultTypePet, textFirst: "PET", textSecond: "HUMAN")
                     .padding(.leading, 30)
               }

               HStack(spacing: 30) {
                  isShowingResult ? RecordingView(resultType: $resultTypeHuman) : RecordingView(resultType: $resultTypePet)

                  ZStack {
                     RoundedRectangle(cornerRadius: 16)
                        .frame(width: 107, height: 176)
                        .foregroundStyle(Color.white)
                     VStack {
                        RightChangeView(resultType: $resultTypeHuman, image: Images.Pets.catSmall, color: Style.Colors.catBackgroundColor) {
                           isShowingResult = true
                        }

                        RightChangeView(resultType: $resultTypePet, image: Images.Pets.dogSmall, color: Style.Colors.dogBackgroundColor) {
                           isShowingResult = false
                        }
                     }
                  }
               }
            }
            Spacer()

            isShowingResult ? AnyView(Images.Pets.catBig) : AnyView(Images.Pets.dogBig)

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

//#Preview {
//   HumanView() {
//
//   }
//}
