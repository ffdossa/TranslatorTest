//
//  RecordingViewModel.swift
//  TranslatorTest
//
//  Created by Andrii Marchuk on 12.02.2025.
//

import Foundation
import AVFoundation
import Combine

class RecordingViewModel: ObservableObject {
   @Published var isRecording = false
   @Published private var showResult = false

   init() {
      
   }

   var audioRecorder: AVAudioRecorder?

   func requestPermission(completion: @escaping (Bool) -> Void) {
      AVAudioSession.sharedInstance().requestRecordPermission { granted in
         DispatchQueue.main.async {
            completion(granted)
         }
      }
   }

   func startRecording() {
      let session = AVAudioSession.sharedInstance()
      do {
         try session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
         try session.setActive(true)

         let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("recording.m4a")
         let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
         ]

         audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
         audioRecorder?.record()
         isRecording = true
      } catch {
         print("Failed to start recording: \(error.localizedDescription)")
      }
   }

   func stopRecording() {
      audioRecorder?.stop()
      isRecording = false
      try? AVAudioSession.sharedInstance().setActive(false)
   }
}
