//
//  ViewController.swift
//  networkLayer2
//
//  Created by Ömer Oğuz Çelikel on 21.10.2022.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //NetworkService.shared.myFirstRequest()
//        NetworkService.shared.myFirstRequest { (result) in
//            switch result {
//            case .success(let data):
//                //print("The decoded data is: \(data)")
//                for dish in data {
//                    print(dish.name ?? "")
//                }
//            case .failure(let error):
//                print("The eror is: \(error.localizedDescription)")
//            }
//        }
        
        //ProgressHUD.show()
        NetworkService.shared.helloWorldAPI()
//        NetworkService.shared.fetchAllCategories { [weak self] (result) in
//            switch result {
//            case .success(let allDishes):
//                print("It is successful")
//                print("\n\n \(allDishes)")
//                ProgressHUD.dismiss()
//            case .failure(let error):
//                //print("The error is \(error.localizedDescription)")
//                ProgressHUD.showError(error.localizedDescription)
//            }
//        } // networkServicefetchAllCategories
        
        
    } // viewDidLoad
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("email: \(emailTextField.text!)")
        print("password: \(passwordTextfield.text!)")
        NetworkService.shared.login(email: emailTextField.text!, password: passwordTextfield.text!) {
            [weak self] (result) in
                switch result {
                case .success(let data):
                    print("It is successful")
                    print("\n\n \(data)")
                    ProgressHUD.dismiss()
                case .failure(let error):
                    print("failure calisti", error.localizedDescription)
                    //print("The error is \(error.localizedDescription)")
                    //ProgressHUD.showError(error.localizedDescription)
                }
        }
    }
    
}

