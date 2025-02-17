//
//  TabBarView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct TabBarView: View {
   @Binding var tabSelected: Int

   let tabBarItems: [(image: String, title: String)] = [
      ("messages", "Translator"),
      ("volume-high", "Sounds"),
      ("note", "Articles"),
      ("stop-circle", "Clicker")
   ]

   var body: some View {
      Spacer()
      ZStack(alignment: .center) {
         RoundedRectangle(cornerRadius: 30)
            .frame(width: 350, height: 94)
            .foregroundStyle(Color.white)
         HStack(spacing: 42) {
            ForEach(0..<4) { index in
               Button {
                  tabSelected = index + 1
               } label: {
                  VStack {
                     Image(tabBarItems[index].image)

                     Text(tabBarItems[index].title)
                        .font(.caption2)
                  }
               }
            }
         }
         .tint(Style.Colors.basicColor)
      }
      .padding(.bottom)
   }
}

#Preview {
   TabBarView(tabSelected: .constant(0))
}
