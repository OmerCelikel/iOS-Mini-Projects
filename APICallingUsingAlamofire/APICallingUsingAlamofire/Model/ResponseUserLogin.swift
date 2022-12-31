//
//  ResponseUserLogin.swift
//  APICallingUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 28.10.2022.
//

import Foundation
// MARK: - ResponseUserLogin
struct ResponseUserLogin: Codable {
    let succeeded: Bool?
    let data: DataClass?
    let message: String?
    //let errors: NSNull?
    let statusCode: Int?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int?
    let firstName, lastName, email, token: String?
    let refreshToken: RefreshToken?
    let profileImage, role: String?
}

// MARK: - RefreshToken
struct RefreshToken: Codable {
    let tokenString, expireAt, email: String?
}
