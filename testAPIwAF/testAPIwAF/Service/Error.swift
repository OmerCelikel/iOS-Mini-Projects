//
//  Error.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

enum APIErrors: Error {
    case custom(message: String)
}
// returns success and failure
typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void
