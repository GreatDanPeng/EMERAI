//
//  EMERAIApp.swift
//  EMERAI
//
//  Created by Dan Peng on 4/17/24.
//

import SwiftUI
import Firebase

@main
struct EMERAIApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(viewModel)
        }
    }
}
