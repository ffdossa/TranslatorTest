//
//  SettingsView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct SettingsView: View {
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
            .navigationTitle("Settings")
            .padding()
            
            .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
            
            .background(
                .linearGradient(Gradient(colors: [Color.init(hexString: "#F3F5F6"), Color.init(hexString: "#C9FFE0")]), startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    SettingsView()
}
