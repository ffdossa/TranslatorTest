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
    //    @Binding var newRecordingPresented: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .center) {
                    HStack(spacing: 128) {
                        Text("HUMAN")
                            .bold()
                        
                        Text("PET")
                            .bold()
                            .padding(.trailing)
                    }
                    
                    Button {
                        // action
                    } label: {
                        Image("arrow-swap-horizontal")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 35) {
                    ListenButtonView() {
                        //
                    }
                    
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
                }
                Spacer()
                
                Image("dog-big")
                
                
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
