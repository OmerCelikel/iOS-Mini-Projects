//
//  Welcome.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

struct Welcome: Codable {
    let succeeded: Bool?
    let data: DataClass?
    let message: String?
    let statusCode: Int?
}
