//
//  DishCategory.swift
//  networkLayer2
//
//  Created by Ömer Oğuz Çelikel on 21.10.2022.
//

import Foundation

struct DishCategory: Codable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey{
        // in my app -> what did come from backend
        case id
        case name = "title"
        case image
    }
}
