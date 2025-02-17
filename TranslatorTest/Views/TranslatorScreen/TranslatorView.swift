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
   @State private var showResult = false
   @State private var toShowResult = false

   var body: some View {
      NavigationView {
         VStack(spacing: 110) {
            ZStack(alignment: .center) {
               RoundedRectangle(cornerRadius: 30)
                  .frame(width: 350, height: 94)
                  .foregroundStyle(Color.white)

               TypeResultButton(resultType: showResult ? .human : .pet) {
                  showResult.toggle()
               }

               SwapButtonImage(
                  firstImage: showResult ? Types.Images.human : Types.Images.pet,
                  secondImage: showResult ? Types.Images.pet : Types.Images.human,
                  firstColor: showResult ? Style.Colors.humanBackgroundColor : Style.Colors.petBackgroundColor,
                  secondColor: showResult ? Style.Colors.petBackgroundColor : Style.Colors.humanBackgroundColor
               )
            }

            RecordingView(resultType: showResult ? .human : .pet)

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
