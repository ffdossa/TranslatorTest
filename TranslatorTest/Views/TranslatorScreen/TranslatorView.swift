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
   @StateObject var viewModel = TranslatorViewModel()
   
   var body: some View {
      NavigationView {
         VStack{
            ChangeSpeakScreenView()
         }
      }
   }
}

#Preview {
   MainView()
}
