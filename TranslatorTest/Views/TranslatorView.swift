//
//  MainView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct TranslatorView: View {
  @StateObject var viewModel = TranslatorViewViewModel()
  @State private var imageName: String = "cat-big"
  @State private var textHuman: String = "HUMAN"
  @State private var textPet: String = "PET"
  
  
  var body: some View {
    NavigationView {
      VStack {
        ZStack(alignment: .center) {
          HStack(spacing: 128) {
            Text(textHuman)
              .bold()
            
            Text(textPet)
              .bold()
              .padding(.trailing)
          }
          
          Button {
            swap(&textHuman, &textPet)
          } label: {
            Image("arrow-swap-horizontal")
          }
        }
        
        Spacer()
        
        HStack(spacing: 35) {
          ListenButtonView() {
            // action
          }
          
          ZStack {
            RoundedRectangle(cornerRadius: 16)
              .frame(width: 107, height: 176)
              .foregroundStyle(Color.white)
            VStack {
              Button {
                imageName = "cat-big"
              } label: {
                ZStack {
                  RoundedRectangle(cornerRadius: 8)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color.init(hexString: "#D1E7FC"))
                  Image("cat-small")
                }
              }
              
              
              Button {
                imageName = "dog-big"
              } label: {
                ZStack {
                  RoundedRectangle(cornerRadius: 8)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color.init(hexString: "#ECFBC7"))
                  
                  Image("dog-small")
                }
              }
            }
          }
        }
        Spacer()
        
        Image(imageName)
        
        Spacer()
      }
      
      .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
      
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Translator")
            .font(.largeTitle)
            .bold()
        }
      }
      
      .foregroundStyle(Color.init(hexString: "#292D32"))
      
      .background(
        .linearGradient(Gradient(colors: [Color.init(hexString: "#F3F5F6"), Color.init(hexString: "#C9FFE0")]), startPoint: .top, endPoint: .bottom))
      
      //            .sheet(isPresented: $viewModel.showingRecordingView) {
      //                RecordingView(newRecordingPresented: $viewModel.showingRecordingView)
      //            }
    }
  }
}


#Preview {
  MainView()
}
