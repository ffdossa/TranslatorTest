//
//  MainView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 07.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                ZStack(alignment: .center) {
                    HStack(spacing: 60) {
                        
                        Text("HUMAN")
                            .bold()
                        
                        Button {
                            // action
                        } label: {
                            Image("arrow-swap-horizontal")
                        }
                        
                        Text("PET")
                            .bold()
                        
                    }
                    
                }
                
                .padding(.top, 28)
                
                HStack(spacing: 35) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 178, height: 176, alignment: .center)
                            .foregroundStyle(Color.white)
                        Button {
                            // action
                        } label: {
                            
                            VStack {
                                Image("microphone")
                                    .bold()
                                
                                Text("Start Speak")
                                    .bold()
                                    .foregroundStyle(Color.init(hexString: "#393736"))
                            }
                        }
                    }
                    .padding(.top, 74)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 107, height: 176)
                            .foregroundStyle(Color.white)
                        VStack {
                            Button {
                                // action
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 70, height: 70)
                                        .foregroundStyle(Color.init(hexString: "#D1E7FC"))
                                    Image("cat-small")
                                }
                            }
                            
                            
                            Button {
                                // action
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
                    .padding(.top, 74)
                }
                
                
                Image("dog-big")
                    .padding(.top, 51)
                
                Spacer()
            }
            .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
            .foregroundStyle(Color.init(hexString: "#292D32"))
            .navigationTitle("Translator")
            .background(
                .linearGradient(Gradient(colors: [Color.init(hexString: "#F3F5F6"), Color.init(hexString: "#C9FFE0")]), startPoint: .top, endPoint: .bottom))
        }
    }
}


#Preview {
    MainView()
}
