//
//  ViewController.swift
//  APICallingUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login Button Tapped")
        guard let email = self.emailTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        let login = RequestUserLogin(email: email, password: password)
        APIManager.shareInstance.callingLoginAPI(userLogin: login)
        
        
    }
    
}

