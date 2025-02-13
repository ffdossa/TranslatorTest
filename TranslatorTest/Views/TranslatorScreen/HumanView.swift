//
//  ListenButtonView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct HumanView: View {
   @StateObject private var modelData = ModelData()
   @StateObject private var audioRecorder = RecordingViewModel()
   @State private var imageName = false

   var swapAction: () -> Void

   var body: some View {
      NavigationView {
         VStack {
            VStack(spacing: 100) {
               ZStack(alignment: .center) {
                  SwapButton(action: swapAction)

                  TextSwapButton(textFirst: "HUMAN", textSecond: "PET")
                     .padding(.trailing, 30)
               }

               HStack(spacing: 30) {
                  RecordingButtonView() {
                     // SOME ACTION
                  }

                  ZStack {
                     RoundedRectangle(cornerRadius: 16)
                        .frame(width: 107, height: 176)
                        .foregroundStyle(Color.white)
                     VStack {
                        Button {
                           imageName = true
                        } label: {
                           ZStack {
                              RoundedRectangle(cornerRadius: 8)
                                 .frame(width: 70, height: 70)
                                 .foregroundStyle(Style.Colors.catBackgroundColor)
                              Images.Pets.catSmall
                           }
                        }

                        Button {
                           imageName = false
                        } label: {
                           ZStack {
                              RoundedRectangle(cornerRadius: 8)
                                 .frame(width: 70, height: 70)
                                 .foregroundStyle(Style.Colors.dogBackgroundColor)

                              Images.Pets.dogSmall
                           }
                        }
                     }
                  }
               }
            }
            Spacer()

            imageName ? AnyView(Images.Pets.catBig) : AnyView(Images.Pets.dogBig)

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
   HumanView() {

   }
}
