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
                ButtonSettingTapView(title: "Rate Us") {
                    // action
                }
                
                ButtonSettingTapView(title: "Share App") {
                    // action
                }
                
                ButtonSettingTapView(title: "Contact Us") {
                    // action
                }
                
                ButtonSettingTapView(title: "Restore Purchases") {
                    // action
                }
                
                ButtonSettingTapView(title: "Privacy Policy") {
                    // action
                }
                
                ButtonSettingTapView(title: "Terms of Use") {
                    // action
                }
                
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
