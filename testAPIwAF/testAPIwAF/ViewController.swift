//
//  ViewController.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var token = ""
    private let jsonService: JsonPlaceHolderProtocol = JsonPlaceHoldeerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: Any) {
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else  { return }
        openHomePage(email: email, password: password)
    }
    
    func openHomePage(email: String, password: String) {
        print("openHomePage")
        loginAPI(email: email, password: password)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homePageViewController") as! HomePageViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        /*
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         if let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homePageViewController") as? HomePageViewController {
             self.present(nextViewController, animated:true, completion:nil)
         }
         */
    }
    
    
//    func initGetService() {
//        jsonService.callingLoginAPI(userLogin: <#T##RequestUserLogin#>, completionHandler: Handler) { [weak self] (models) in
//            print("data: ", models)
//        } onFail: { (data) in
//            print(data ?? "")
//        }
//
//    }
    
    func loginAPI(email: String, password: String) {
        let modelLogin = RequestUserLogin(email: email, password: password)
        jsonService.callingLoginAPI(userLogin: modelLogin) { (result) in
            switch result {
            case .success(let json):
                let token = (json as! ResponseUserLogin).data?.token ?? ""
                let succeeded = (json as! ResponseUserLogin).succeeded ?? false
                print("json: \(String(describing: json))")
                TokenService.tokenInstance.saveToken(token: self.token)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

