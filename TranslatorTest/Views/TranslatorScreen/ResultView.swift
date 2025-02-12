//
//  ResultView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI

enum ResultType {
    case human
    case pet
}

struct ResultView: View {
   @StateObject private var modelData = ModelData()
   @StateObject var viewModel = ResultViewModel()
   @State private var isProcessing = true
   @Environment(\.presentationMode) var presentationMode

   var resultType: ResultType

   var body: some View {
      NavigationView {
         VStack {
            Spacer()

            Button {
               if isProcessing {
                  isProcessing = false
                  modelData.loadRandomResult(for: resultType)
               }
            } label: {
               ZStack {
                  RoundedRectangle(cornerRadius: 16)
                     .frame(width: 291, height: 142)
                     .foregroundStyle(Color.init(hexString: "#D6DCFF"))
                  Text(isProcessing ? "Process of translation..." : modelData.randomText)
                     .font(.footnote)
                     .bold()
               }
            }
            Images.Pets.dogBig
               .padding(.top, 125)

            Spacer()
         }

         .onAppear {
            modelData.loadRandomResult(for: resultType)
         }

         .toolbar {
            ToolbarItem(placement: .topBarLeading) {
               ToolBarButton(image: Image("close")) {
                  presentationMode.wrappedValue.dismiss()
               }
            }

            ToolbarItem(placement: .principal) {
               Text("Result")
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
      .navigationBarBackButtonHidden(true)
   }
}

