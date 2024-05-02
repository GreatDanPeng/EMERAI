//
//  AskView.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//


import SwiftUI

struct AskView: View {
    @State private var userMessage = ""
    @State private var messages: [Message] = []

    var body: some View {
        VStack {
            List(messages) { message in
                HStack {
                    if message.isFromUser {
                        Spacer()
                        Text(message.text)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                    } else {
                        Text(message.text)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }

            HStack {
                TextField("Ask a question...", text: $userMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                }
                .padding()
            }
        }
        .navigationTitle("Ask ChatGPT")
    }

    func sendMessage() {
        let newMessage = Message(text: userMessage, isFromUser: true)
        messages.append(newMessage)
        userMessage = ""
        sendToChatGPT(messageText: newMessage.text)
    }

    func sendToChatGPT(messageText: String) {
        // API integration code will go here
    }
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isFromUser: Bool
}


#Preview {
    AskView()
}
