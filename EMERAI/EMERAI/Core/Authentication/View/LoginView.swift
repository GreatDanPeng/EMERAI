//
//  LoginView.swift
//  EMERAI
//
//  Created by Dan Peng on 4/18/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isShowingContentView = false
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white.opacity(0.2))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login"){
                        Task {
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                         // Authenticate user
                        autheticateUser(email: email, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    
                    .fullScreenCover(isPresented: $isShowingContentView, content: ContentView.init)
                
                    NavigationLink(destination: {
                        SignupView()
                    }, label: {
                        HStack(spacing: 3){
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                    })
                }
                
                
                .navigationBarHidden(true)
            }
        }
        
    }
    
    
    func autheticateUser(email: String, password: String) {
        if email == "dan.peng.1202@gmail.com" {
            wrongEmail = 0
            if password == "abc123" {
                wrongPassword = 0
                isShowingContentView = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongEmail = 2
        }
    }
}


extension LoginView: AuthenticationFromProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

