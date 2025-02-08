//
//  ListenButtonView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 08.02.2025.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct ListenButtonView: View {
    @StateObject private var viewModel = RecordingViewViewModel()
    @State private var micAccessGranted = false
    @State private var showAlert = false
    
    
    var imageRecording: AnimatedImage {
        AnimatedImage(name: "recording.gif")
            .resizable()
    }
    
    var imageMicrophone: Image {
        Image("microphone")
    }
    
    let action: () -> Void
    
    
    var body: some View {
        if micAccessGranted {
            Button {
                // action
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 178, height: 176, alignment: .center)
                        .foregroundStyle(Color.white)
                    VStack {
                        imageRecording
                            .frame(width: 163, height: 95)
                        
                        Text("Recording...")
                            .bold()
                            .foregroundStyle(Color.init(hexString: "#393736"))
                        
                    }
                }
            }
            .onAppear {
                checkMicrophonePermission()
            }
        } else {
            Button {
                requestMicrophonePermission()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 178, height: 176, alignment: .center)
                        .foregroundStyle(Color.white)
                    VStack {
                        imageMicrophone
                        
                        Text("Start Speak")
                            .bold()
                            .foregroundStyle(Color.init(hexString: "#393736"))
                        
                    }
                }
            }
        }
    }
    func checkMicrophonePermission() {
        let permission = AVAudioSession.sharedInstance().recordPermission
        micAccessGranted = (permission == .granted)
    }
    
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                micAccessGranted = granted
                showAlert = true
            }
        }
    }
}


#Preview {
    ListenButtonView() {
        
    }
}
