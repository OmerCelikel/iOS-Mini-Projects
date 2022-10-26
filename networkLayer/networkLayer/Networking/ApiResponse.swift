//
//  ApiResponse.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    // data can be everything Int String etc. T dynamic and particilar strcutıre
    let data: T?
    let error: String?
}
