//
//  HomeVC.swift
//  AutoLoginUserDefaults
//
//  Created by Ömer Oğuz Çelikel on 23.08.2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutUser(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
