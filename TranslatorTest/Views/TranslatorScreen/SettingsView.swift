//
//  SettingsView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct SettingsView: View {
   @StateObject private var viewModel = SettingsViewModel()
   @State private var isButtonPressed = false

   var body: some View {
      NavigationView {
         VStack(spacing: 14) {
            ForEach(viewModel.setupSettingsItems()) { link in
               LinkButton(itemModel: link)
            }
            Spacer()
         }
         .padding(.leading)
         .padding(.trailing)

         .toolbar {
            ToolbarItem(placement: .principal) {
               Text("Settings")
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
   SettingsView()
}
