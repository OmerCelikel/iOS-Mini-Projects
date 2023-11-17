//
//  OnboardRouter.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import UIKit

protocol OnboardRouterProtocol {
    func navigateToLinksDashboard()
}

class OnboardRouter {
    
    var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
}

extension OnboardRouter: OnboardRouterProtocol {
    func navigateToLinksDashboard() {
        let linksDashboardStoryboard = UIStoryboard(name: "LinksDashboard", bundle: nil)
        if let linksDashboardViewController = linksDashboardStoryboard.instantiateInitialViewController() {
            linksDashboardViewController.modalPresentationStyle = .fullScreen
            viewController?.present(linksDashboardViewController, animated: true, completion: nil)
        }
    }
}


