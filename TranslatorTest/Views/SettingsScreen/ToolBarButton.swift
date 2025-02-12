//
//  ToolBarButton.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 12.02.2025.
//

import SwiftUI


struct ToolBarButton: View {
   var image: Image
   var someAction: () -> Void

   var body: some View {
      Button {
         someAction()
      } label: {
         ZStack {
            Circle()
               .fill(Color.white)
               .frame(width: 48, height: 48)

            image
         }
      }
   }
}

#Preview {
   ToolBarButton(image: Image("close")) {
      
   }
}
