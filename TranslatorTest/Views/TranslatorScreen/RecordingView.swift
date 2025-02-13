//
//  RecordingView.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 12.02.2025.
//


import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct RecordingView: View {
   @StateObject var recordingViewModel = RecordingViewModel()
   @State private var isRecording = false
   @State private var showSettingsAlert = false
   @State private var toShowResult = false
   @Binding var resultType: ResultType

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
      NavigationLink(destination: ResultView(resultType: resultType), isActive: $toShowResult) {
         EmptyView()
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
   }

   private func handleRecordingButton() {
      switch AVAudioSession.sharedInstance().recordPermission {
      case .undetermined:
         recordingViewModel.requestPermission { granted in
            if granted {
               startRecording()
            }
         }
      case .denied:
         showSettingsAlert = true
      case .granted:
         if recordingViewModel.isRecording {
            stopRecording()
         } else {
            startRecording()
         }
      @unknown default:
         break
      }
   }

   private func startRecording() {
      recordingViewModel.startRecording()
      isRecording = true
   }

   func stopRecording() {
      recordingViewModel.stopRecording()
      isRecording = false
      toShowResult = true
   }

   private func openSettings() {
      guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
      if UIApplication.shared.canOpenURL(settingsURL) {
         UIApplication.shared.open(settingsURL)
      }
   }
}
