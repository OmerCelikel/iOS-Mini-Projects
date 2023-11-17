//
//  OnboardViewController.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import UIKit

protocol OnboardViewControllerProtocol: AnyObject { }

class OnboardViewController: UIViewController {
    
    lazy var presenter: OnboardPresenterProtocol? = OnboardPresenter(view: self, router: OnboardRouter(viewController: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dashboarButtonTapped(_ sender: Any) {
        presenter?.navigateToDashboard()
    }
    
}

extension OnboardViewController: OnboardViewControllerProtocol { }
