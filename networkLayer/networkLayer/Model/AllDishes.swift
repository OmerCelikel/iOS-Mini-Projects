//
//  AllDishes.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
