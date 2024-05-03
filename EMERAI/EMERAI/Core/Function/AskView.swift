//
//  AskView.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//

import Foundation
import SwiftUI
import GoogleGenerativeAI

struct ChatMessage: Identifiable, Equatable {
    let id: UUID = UUID()
    let text: String
    let isUser: Bool  // Determines the message origin, user or bot

    // Implement the static '==' function to conform to 'Equatable'
    static func ==(lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        lhs.id == rhs.id && lhs.text == rhs.text && lhs.isUser == rhs.isUser
    }
}

struct AskView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText: String = ""
    @State private var responseText: String? = nil
    @State private var showingImagePicker = false
    @State private var images: [UIImage] = []
    @State private var isRequesting = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(viewModel.messages) { message in
                                ChatBubble(message: message)
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemGray6))  // Light gray background
                    .onChange(of: viewModel.messages) {
                        scrollToLastMessage(with: proxy)
                    }
                    
                    
                    HStack {
                        Button(action: {
                            showingImagePicker = true
                        }, label: {
                            Image(systemName: "photo.on.rectangle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.blue)
                        })
                        TextField("Type your message here...", text: $viewModel.inputText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(minHeight: CGFloat(30))
                        
                        Button(action: {
                            Task {
                                await askGemini()
                            }
                        }) {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.blue)
                        }
                        .disabled(isRequesting)
                        .padding()
                        
                        if let response = responseText {
                            Text(response)
                                .padding()
                        }
                    }
                    .padding()
                }
                .navigationTitle("Ask Gemini Expert!")
                .navigationBarTitleDisplayMode(.inline) // Correct usage here
                
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(images: $images)
                }
            }
        }
    }
    private func scrollToLastMessage(with proxy: ScrollViewProxy) {
        if let lastMessageId = viewModel.messages.last?.id {
            withAnimation {
                proxy.scrollTo(lastMessageId, anchor: .bottom)
            }
        }
    }
    
    private func askGemini() async {
        guard !inputText.isEmpty else { return }
        isRequesting = true
        
        let model = GenerativeModel(name: "gemini-pro-vision", apiKey: APIKey.default)
        
        do {
            let response = try await model.generateContent(inputText, images[0], images[1])
            if let text = response.text {
                self.responseText = text
            }
        } catch {
            responseText = "Error generating response."
            print(error.localizedDescription)
        }
        
        isRequesting = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.images.append(image)
            }
            
            picker.dismiss(animated: true)
        }
    }
}

struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text(message.text)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
        }
    }
}

struct AskView_Previews: PreviewProvider {
    static var previews: some View {
        AskView()
    }
}
