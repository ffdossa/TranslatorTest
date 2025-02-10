//
//  SettingsView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct SettingsView: View {
  @StateObject var viewModel = SettingsViewViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 14) {
        SettingLinkView(title: "Rate Us")

        SettingLinkView(title: "Share App")

        SettingLinkView(title: "Contact Us")

        SettingLinkView(title: "Restore Purchases")

        SettingLinkView(title: "Privacy Policy")

        SettingLinkView(title: "Terms of Use")

//        SettingButtonView(title: "Rate Us") {
//          // action
//        }
//
//        SettingButtonView(title: "Share App") {
//          // action
//        }
//
//        SettingButtonView(title: "Contact Us") {
//          // action
//        }
//
//        SettingButtonView(title: "Restore Purchases") {
//          // action
//        }
//
//        SettingButtonView(title: "Privacy Policy") {
//          // action
//        }
//
//        SettingButtonView(title: "Terms of Use") {
//          // action
//        }

        Spacer()
      }
      .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
      .padding(.leading)
      .padding(.trailing)

      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Settings")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.init(hexString: "#292D32"))
        }
      }

      .background(
        .linearGradient(Gradient(colors: [Color.init(hexString: "#F3F5F6"), Color.init(hexString: "#C9FFE0")]), startPoint: .top, endPoint: .bottom))
    }
  }
}

#Preview {
  SettingsView()
}
