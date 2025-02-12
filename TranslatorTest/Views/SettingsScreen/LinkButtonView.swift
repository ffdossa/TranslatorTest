//
//  SettingLinkView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 09.02.2025.
//

import SwiftUI

struct LinkButtonView: View {
   @State private var isSharing = false
   let itemModel: ItemModel

   var body: some View {
      Button {
         isSharing = true
      } label: {
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
      .sheet(isPresented: $isSharing) {
         ShareSheet(items: [itemModel.link])
      }
   }
}

struct ShareSheet: UIViewControllerRepresentable {
   let items: [Any]

   func makeUIViewController(context: Context) -> UIActivityViewController {
      return UIActivityViewController(activityItems: items, applicationActivities: nil)
   }

   func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
   LinkButtonView(itemModel: ItemModel(title: "Rate Us", link: "https://github.com/ffdossa"))
}
