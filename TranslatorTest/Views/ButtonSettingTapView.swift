//
//  ButtonSettingTapView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct ButtonSettingTapView: View {
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button {
            // action
        } label: {
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
    ButtonSettingTapView(title: "Title") {
        
    }
}
