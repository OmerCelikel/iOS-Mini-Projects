//
//  DataClass.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

struct DataClass: Codable {
    let id: Int?
    let firstName, lastName, email, token: String?
    let refreshToken: RefreshToken?
    let profileImage: String?
}
