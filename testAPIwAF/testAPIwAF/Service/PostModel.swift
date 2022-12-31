//
//  PostModel.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

struct PostModel: Codable {
    let userID, id: Int?
    let title, body: String?
}
