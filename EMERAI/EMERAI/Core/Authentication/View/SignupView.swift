//
//  SignupView.swift
//  EMERAI
//
//  Created by Dan Peng on 4/18/24.
//

import SwiftUI
import UIKit

struct SignupView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passwordsMatch: Bool = true
    @State private var showingLoginScreen = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.2))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    ZStack(alignment: .trailing) {
                        SecureField("Confirm Password", text: $confirmPassword)
                                      .padding()
                                      .frame(width: 300, height: 50)
                                      .background(Color.black.opacity(0.05))
                                      .cornerRadius(10)
                                      .border(passwordsMatch ? Color.clear : Color.red, width: 2)
                                      
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                            
                        }
                    }
                    
                                    
                                  
                    
                    Button("Sign Up"){
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, username: username)
                        }
                        checkPasswordsMatch()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    
                    Button{
                        dismiss()
                    } label: {
                        HStack(spacing: 3){
                            Text("Already have an account?")
                            Text("Sign in")
                                .fontWeight(.bold)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
        
    }
    
    private func checkPasswordsMatch() {
            passwordsMatch = password == confirmPassword
   }
}

#Preview {
    SignupView()
}
