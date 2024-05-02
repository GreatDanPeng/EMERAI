//
//  LoginView.swift
//  EMERAI
//
//  Created by Dan Peng on 4/18/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isShowingMainView = false

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
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login"){
                        // Authenticate user
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    
                    .fullScreenCover(isPresented: $isShowingMainView, content: MainView.init)
                
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
    func autheticateUser(username: String, password: String) {
        if username == "danpeng2024" {
            wrongUsername = 0
            if password == "abc123" {
                wrongPassword = 0
                isShowingMainView = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}


        


#Preview {
    LoginView()
}

