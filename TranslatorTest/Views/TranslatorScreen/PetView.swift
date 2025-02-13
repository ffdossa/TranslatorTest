//
//  ListenView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI


struct PetView: View {
   @StateObject var viewModel = PetViewModel()
   @State private var isSettingsPresented = false
   @State private var toShowResult = false

   var swapAction: () -> Void

   var body: some View {
      NavigationView {
         VStack {
            VStack(spacing: 100) {
               ZStack(alignment: .center) {
                  SwapButton(action: swapAction)

                  TextSwapButton(textFirst: "PET", textSecond: "HUMAN")
                     .padding(.leading, 30)
               }

               RecordingButtonView() {
                  // SOME ACTION
               }
            }
            Spacer()

            ZStack {
               RoundedRectangle(cornerRadius: 30)
                  .frame(width: 350, height: 94)
                  .foregroundStyle(Color.white)
               HStack(spacing: 100) {
                  Button {
                     // SOME ACTION
                  } label: {
                     ZStack {
                        Circle()
                           .frame(width: 70, height: 70)
                           .foregroundStyle(Style.Colors.catBackgroundColor)

                        Images.Pets.catFace
                           .padding(.top, 8)
                     }
                  }

                  Button {
                     // SOME ACTION
                  } label: {
                     ZStack {
                        Circle()
                           .frame(width: 70, height: 70)
                           .foregroundStyle(Style.Colors.dogBackgroundColor)

                        Images.Pets.dogFace
                     }
                  }
               }
            }

            Spacer()
         }
         .toolbar {
            ToolbarItem(placement: .principal) {
               Text("Translator")
                  .font(.largeTitle)
                  .bold()
            }

            ToolbarItem(placement: .topBarTrailing) {
               ToolBarButton(image: Image("settings")) {
                  isSettingsPresented = true
               }
            }
         }

         .background(
            NavigationLink(destination: SettingsView(), isActive: $isSettingsPresented) {
               EmptyView()
            }
         )

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
//   PetView(toResult: ResultView(resultType: .pet)) {
//
//   }
//}
