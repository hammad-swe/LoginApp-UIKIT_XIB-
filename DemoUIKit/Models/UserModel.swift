//
//  UserModel.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 12/04/2026.
//

import Foundation
struct User : Codable{
    let username: String
    let email: String
    let password: String
}

class UserModel{
    static let key = "user_registered"
    
    // save user - UserDefaults
    
    static func save(_ user: User) {
            if let encoded = try? JSONEncoder().encode(user) {   UserDefaults.standard.set(encoded, forKey: key)  }
        }
    
    // load user - UserDefaults
    static func load() -> User? {
           guard let data = UserDefaults.standard.data(forKey: key),
                 let user = try? JSONDecoder().decode(User.self, from: data) else {
               return nil
           }
           return user
       }
    
    // checking login
    
    static func isRegistered() -> Bool {

                return load() != nil

            } 
    
    
    // clear user logout (Adding for information)
    static func clear() {
           UserDefaults.standard.removeObject(forKey: key)
       }
}
