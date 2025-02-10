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
    ("settings", "Settings")
  ]

  var body: some View {
    Spacer()
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: 16)
        .frame(width: 216, height: 82)
        .foregroundStyle(Color.white)
      HStack(spacing: 42) {
        ForEach(0..<2) { index in
          Button {
            tabSelected = index + 1
          } label: {
            VStack {
              Image(tabBarItems[index].image)
                .tint(Color.init(hexString: "#292D32"))

              Text(tabBarItems[index].title)
                .font(.caption2)
                .foregroundStyle(Color.init(hexString: "#292D32"))
            }
          }
        }
      }
    }
    .padding(.bottom)
  }
}

#Preview {
  TabBarView(tabSelected: .constant(0))
}
