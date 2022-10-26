//
//  RefreshToken.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

struct RefreshToken: Codable {
    let tokenString, expireAt, email: String?
}
