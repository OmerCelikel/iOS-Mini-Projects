//
//  String+Extension.swift
//  listPeopleTest
//
//  Created by Ömer Oğuz Çelikel on 18.12.2023.
//

import Foundation

extension String {
    static func formattedStringWithId(name: String, id: Int) -> String {
        return "\(name) (\(id))"
    }
}
