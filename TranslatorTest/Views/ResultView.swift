//
//  ResultView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI

struct ResultView: View {
  @StateObject var viewModel = ResultViewViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        
        ZStack {
          RoundedRectangle(cornerRadius: 16)
            .frame(width: 291, height: 142)
            .foregroundStyle(Color.init(hexString: "#D6DCFF"))
          
          Text("What are you doing, human?")
            .font(.footnote)
            .bold()
        }
        
        Image("dog-big")
          .padding(.top, 125)
        
        Spacer()
      }
      .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
      
      .toolbar {
        ToolbarItemGroup(placement: .topBarLeading) {
          Button {
            // action
          } label: {
            ZStack {
              Circle()
                .fill(Color.white)
                .frame(width: 48, height: 48)
              
              Image("close")
            }
          }
        }
        
        ToolbarItem(placement: .principal) {
          Text("Result")
            .font(.largeTitle)
            .bold()
        }
      }
      
      .foregroundStyle(Color.init(hexString: "#292D32"))
      
      .background(
        .linearGradient(Gradient(colors: [Color.init(hexString: "#F3F5F6"), Color.init(hexString: "#C9FFE0")]), startPoint: .top, endPoint: .bottom))
    }
  }
}

#Preview {
  ResultView()
}
