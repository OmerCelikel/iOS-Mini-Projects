//
//  ViewController.swift
//  AutoLoginUserDefaults
//
//  Created by Ömer Oğuz Çelikel on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") {
            // user is alreadyy logged in
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVC, animated: false)
        }
    }
    
    @IBAction func authenticateUser(_ sender: Any) {
        if txtUserName.text == "admin" && txtPassword.text == "admin"{
            // go to HomeVC
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVC, animated: true)
            
            // after user login to app, if closses app without logout and wants to open again, not need to see login screen again
            UserDefaults.standard.set(true, forKey: "IsUserLoggedIn")
        }
        
    }
}


