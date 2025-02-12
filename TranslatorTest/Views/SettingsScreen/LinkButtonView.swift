//
//  SettingLinkView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 09.02.2025.
//

import SwiftUI

struct LinkButtonView: View {
   let itemModel: ItemModel

   var body: some View {
      Link(destination: URL(string: itemModel.link)!) {
         ZStack {
            RoundedRectangle(cornerRadius: 20)
               .frame(height: 50)
               .foregroundStyle(Color.init(hexString: "#D6DCFF"))
            HStack {
               Text(itemModel.title)
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
   LinkButtonView(itemModel: ItemModel(title: "Rate Us", link: "https://github.com/ffdossa/TranslatorTest"))
}
