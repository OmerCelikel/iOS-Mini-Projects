//
//  AppError.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "NO IDEA what's going on"
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let error):
            return error
        }
    }
}
