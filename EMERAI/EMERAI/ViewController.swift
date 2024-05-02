//
//  ViewController.swift
//  EMERAI
//
//  Created by Dan Peng on 4/30/24.
//

import Foundation

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let loginView = view as? LoginView {
            loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        }
    }

    @objc func handleLogin() {
        print("Login button tapped")
        // Add login logic here
    }
}
