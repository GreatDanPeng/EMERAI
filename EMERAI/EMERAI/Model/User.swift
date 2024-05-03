//
//  User.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: username) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
            
    }
}

extension User {
    static var Mock_User = User(id: NSUUID().uuidString, username: "Dan Peng", email: "dan.peng.1202@gmail.com")
}
