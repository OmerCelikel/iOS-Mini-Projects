//
//  Route.swift
//  networkLayer2
//
//  Created by Ömer Oğuz Çelikel on 21.10.2022.
//

import Foundation

enum Route {
    //static let baseUrl = "https://yummie.glitch.me"
    static let baseUrl = "http://testapi-do-veloper.fw.dteknoloji.com.tr"
    
    //end points
    //case authorizationToken
    case login
    case helloWord
    case temp
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .temp:
            return "/dish-categories"
            //return "/api/HelloWorld"
            //return "/dishes/cat1"
        case .fetchAllCategories:
            return "/dish-categories"
//        case .authorizationToken:
//            return "Authorization/RequestToken"
        case .login:
            return "/api/User/Login"
        case .helloWord:
            return "/api/HelloWorld"
        }
    }
}
