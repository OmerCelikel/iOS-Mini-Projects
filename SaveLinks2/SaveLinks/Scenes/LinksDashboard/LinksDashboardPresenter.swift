//
//  LinksDashboardPresenter.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import Foundation
import UIKit

protocol LinksDashboardPresenterProtocol {
    var linkItems: [LinkItem] { get }
}

class LinksDashboardPresenter {
    
    weak var view: LinksDashboardViewControllerProtocol?
    var router: LinksDashboardRouterProtocol?
    
    let linkItems: [LinkItem] = [
        LinkItem(url: URL(string: "https://www.example1.com"), name: "Example 1", image: UIImage(named: "example1")),
        LinkItem(url: URL(string: "https://www.example2.com"), name: "Example 2", image: UIImage(named: "example2")),
        LinkItem(url: URL(string: "https://www.example3.com"), name: "Example 3", image: UIImage(named: "example3")),
        LinkItem(url: URL(string: "https://www.example4.com"), name: "Example 4", image: UIImage(named: "example4"))
    ]

    
    init(view: LinksDashboardViewControllerProtocol?, router: LinksDashboardRouterProtocol?) {
        self.view = view
        self.router = router
    }
    
}

extension LinksDashboardPresenter: LinksDashboardPresenterProtocol { }
