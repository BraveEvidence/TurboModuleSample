//
//  NativeLocalModel.swift
//  myrnapp
//
//  Created by Student on 27/09/25.
//

import Foundation
import FoundationModels


@available(iOS 26.0, *)
@objcMembers class NativeLocalModel: NSObject {
  
  let sessin = LanguageModelSession()
  private let model = SystemLanguageModel.default
  
  
  func ask(prompt: String,completion: @escaping (String?) -> Void) {
    switch model.availability {
    case .available:
      Task {
        let response = try await sessin.respond(to: "Which places to visit in India? Reply only with places name")
        completion(response.content)
      }
    case .unavailable(.appleIntelligenceNotEnabled):
      completion("Apple intelligence not enabled")
    case .unavailable(.modelNotReady):
      completion("Model not ready")
    default:
      completion("Model not ready")
    }
    
  }
  
  
}
