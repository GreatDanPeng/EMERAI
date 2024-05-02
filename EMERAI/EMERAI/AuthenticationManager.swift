//
//  AuthenticationManager.swift
//  EMERAI
//
//  Created by Dan Peng on 4/30/24.
//

import Foundation
import Combine

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false

    func login(username: String, password: String) {
        if username == "Dan" && password == "Peng" {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
}
