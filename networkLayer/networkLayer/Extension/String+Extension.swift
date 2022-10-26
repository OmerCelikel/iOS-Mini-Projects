//
//  String+Extension.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
