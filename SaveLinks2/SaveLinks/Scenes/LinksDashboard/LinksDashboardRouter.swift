//
//  LinksDashboardRouter.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import UIKit

protocol LinksDashboardRouterProtocol { }

class LinksDashboardRouter {
    
    var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
}

extension LinksDashboardRouter: LinksDashboardRouterProtocol { }


