//
//  PostModel.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//
// MARK: - WelcomeElement

struct PostModel: Codable {
    let userID, id: Int?
    let title, body: String?
}

