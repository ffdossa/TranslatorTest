//
//  RecordingView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 12.02.2025.
//


import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct RecordingButtonView: View {
   @StateObject private var audioRecorder = RecordingViewModel()
   @State private var isRecording = false
   @State private var navigateToResult = false
   @State private var showSettingsAlert = false

   var body: some View {
      Button {
         handleRecordingButton()
      } label: {
         ZStack {
            RoundedRectangle(cornerRadius: 20)
               .frame(width: 178, height: 176, alignment: .center)
               .foregroundStyle(Color.white)
            VStack {
               isRecording ?
               AnyView(AnimatedImage(name: "recording.gif")
                  .resizable()
                  .frame(width: 163, height: 95)
               ) :
               AnyView(Image("microphone"))

               Text(isRecording ? "Stop Speak" : "Start Speak")
                  .font(.title3)
                  .bold()
                  .foregroundStyle(Style.Colors.basicColor)
            }
         }
      }

      .alert(isPresented: $showSettingsAlert) {
         Alert(
            title: Text("Enable Microphone Access"),
            message: Text("Please allow access to your mircophone to use the app’s features"),
            primaryButton: .cancel(),
            secondaryButton: .default(Text("Settings"), action: {
               openSettings()
            })
         )
      }

      NavigationLink(destination: ResultView(resultType: .pet), isActive: $navigateToResult) {
         EmptyView()
      }
   }

   private func handleRecordingButton() {
      switch AVAudioSession.sharedInstance().recordPermission {
      case .undetermined:
         audioRecorder.requestPermission { granted in
            if granted {
               startRecording()
            }
         }
      case .denied:
         showSettingsAlert = true
      case .granted:
         if audioRecorder.isRecording {
            stopRecording()
         } else {
            startRecording()
         }
      @unknown default:
         break
      }
   }

   private func startRecording() {
      audioRecorder.startRecording()
      isRecording = true
   }

   private func stopRecording() {
      audioRecorder.stopRecording()
      isRecording = false
      navigateToResult = true
   }

   private func openSettings() {
      guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
      if UIApplication.shared.canOpenURL(settingsURL) {
         UIApplication.shared.open(settingsURL)
      }
   }
}

#Preview {
   RecordingButtonView()
}
