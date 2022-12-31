//
//  TokenService.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

import Foundation

class TokenService {
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    
    func saveToken(token: String) {
        userDefault.set(token, forKey: TokenKey.userLogin)
    }
    
    func getToken() -> String {
        //userDefault.string(forKey: TokenKey.userLogin)
        if let token = userDefault.object(forKey: TokenKey.userLogin) as? String {
            print("TOKEN2: \(token)")
            return token
        } else {
            return ""
        }
        
    }
    
    func checkForLogin() -> Bool {
        if getToken() == ""{
            // logout
            return false
        } else {
            // user already logged in
            return true
        }
    }
    
    func removeToken() {
        userDefault.removeObject(forKey: TokenKey.userLogin)
    }
}
