//
//  Route.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    
    //end points
    case temp
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .temp:
            //return "/dish-categories"
            //return "/api/HelloWorld"
            return "/dishes/cat1"
        case .fetchAllCategories:
            return "/dish-categories"
        }
    }
}
