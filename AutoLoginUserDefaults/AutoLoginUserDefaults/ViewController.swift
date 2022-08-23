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
        // Do any additional setup after loading the view.
    }
    @IBAction func authenticateUser(_ sender: Any) {
        print("button tapped")
    }
    
}

