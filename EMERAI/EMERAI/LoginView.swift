//
//  LoginView.swift
//  EMERAI
//
//  Created by Dan Peng on 4/30/24.
//

import Foundation
import UIKit

class LoginView: UIView {

    // UI Components
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)

    // Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }

    // Setup views
    private func setupViews() {
        backgroundColor = .white
        
        // Username TextField
        usernameTextField.placeholder = "Enter username"
        usernameTextField.borderStyle = .roundedRect
        addSubview(usernameTextField)
        
        // Password TextField
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
        
        // Login Button
        loginButton.setTitle("Log In", for: .normal)
        addSubview(loginButton)
    }
    
    // Setup constraints
    private func setupConstraints() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
