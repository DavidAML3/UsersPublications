//
//  User.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//

import Foundation

class User {
    var name: String
    var phone: String
    var email: String
    
    init(name: String, phone: String, email: String) {
        self.name = name
        self.phone = phone
        self.email = email
    }
}
