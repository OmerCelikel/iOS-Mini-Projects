//
//  ResponseUserLogin.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

struct ResponseUserLogin: Codable {
    let succeeded: Bool?
    let data: DataClass?
    let message: String?
    //let errors: NSNull?
    //let statusCode: Int?
}

struct DataClass: Codable {
    let id: Int?
    let firstName, lastName, email, token: String?
    let refreshToken: RefreshToken?
    let profileImage, role: String?
}

struct RefreshToken: Codable {
    let tokenString, expireAt, email: String?
}
