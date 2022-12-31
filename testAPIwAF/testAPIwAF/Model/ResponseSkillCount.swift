//
//  ResponseSkillCount.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

struct ResponseSkillCount: Codable {
    let succeeded: Bool?
    let data: [Datum]?
    let message: String?
    //let errors: NSNull?
    let statusCode: Int?
}

struct Datum: Codable {
    let skillName: String?
    let count: Int?
    let percentage: Double?
}
