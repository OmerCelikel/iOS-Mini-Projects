//
//  OnboardPresenter.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import Foundation

protocol OnboardPresenterProtocol {
    func navigateToDashboard()
}

class OnboardPresenter {
    
    weak var view: OnboardViewControllerProtocol?
    var router: OnboardRouterProtocol?
    
    init(view: OnboardViewControllerProtocol?, router: OnboardRouterProtocol?) {
        self.view = view
        self.router = router
    }
    
    func navigateToDashboard() {
            // Burada LinksDashboard ekranına geçiş işlemini yapabilirsiniz.
            // Örneğin:
            router?.navigateToLinksDashboard()
        }
    
}

extension OnboardPresenter: OnboardPresenterProtocol { }
