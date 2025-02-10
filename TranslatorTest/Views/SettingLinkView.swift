//
//  SettingLinkView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 09.02.2025.
//

import SwiftUI

struct SettingLinkView: View {
  let title: String

  var body: some View {
    Link(destination: URL(string: "https://github.com/ffdossa/TranslatorTest")!) {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .frame(height: 50)
          .foregroundStyle(Color.init(hexString: "#D6DCFF"))
        HStack {
          Text(title)
            .bold()
            .padding(.leading, 16)
            .foregroundStyle(Color.init(hexString: "#393736"))
          Spacer()

          Image("arrow-right")
            .padding(.trailing, 13)
        }
      }
    }
  }
}

#Preview {
  SettingLinkView(title: "Title")
}
