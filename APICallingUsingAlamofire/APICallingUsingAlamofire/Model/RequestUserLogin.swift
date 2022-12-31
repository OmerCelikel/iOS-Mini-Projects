//
//  RequestUserLogin.swift
//  APICallingUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 28.10.2022.
//

import Foundation

// MARK: - RequestUserLogin
struct RequestUserLogin: Codable {
    let email, password: String?
}
