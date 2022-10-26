//
//  String+Extension.swift
//  networkLayer2
//
//  Created by Ömer Oğuz Çelikel on 21.10.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
