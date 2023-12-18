//
//  ListPeopleRouter.swift
//  listPeople
//
//  Created by Ömer Oğuz Çelikel on 18.12.2023.
//

import UIKit

protocol ListPeopleRouterProtocol { }

class ListPeopleRouter {
    
    var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
}

extension ListPeopleRouter: ListPeopleRouterProtocol { }


