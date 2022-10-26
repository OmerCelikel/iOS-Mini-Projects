//
//  ViewController.swift
//  networkLayer
//
//  Created by Ömer Oğuz Çelikel on 20.10.2022.
//

import UIKit
//import ProgressHUD

class ViewController: UIViewController {
    
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
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                print("It is successful")
                print("\n\n \(allDishes)")
                //ProgressHUD.dismiss()
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
                //ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        
    }
}
