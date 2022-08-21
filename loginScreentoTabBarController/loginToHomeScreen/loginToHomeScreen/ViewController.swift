//
//  ViewController.swift
//  loginToHomeScreen
//
//  Created by Ömer Oğuz Çelikel on 23.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toRegisterButton(_ sender: Any) {
        // ...
        // after login is done, maybe put this in the login web service completion block
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        //(UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    @IBAction func dontHaveAccountBtn(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterSegue", sender: nil)
    }
    
}

