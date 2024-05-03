//
//  ChatViewModel.swift
//  EMERAI
//
//  Created by Dan Peng on 5/3/24.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText: String = ""
    

    func sendMessage() {
        let trimmedText = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        // Add the user's message
        messages.append(ChatMessage(text: trimmedText, isUser: true))

        // Simulate a response after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.messages.append(ChatMessage(text: "Echo: \(trimmedText)", isUser: false))
        }

        inputText = ""  // Clear the input field
        
    }
}
