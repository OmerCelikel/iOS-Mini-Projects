//
//  GetComment.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 26.10.2022.
//

// MARK: - Comment
struct Comment: Codable {
    let postID, id: Int?
    let name, email, body: String?
}

