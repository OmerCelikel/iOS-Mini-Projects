//
//  ViewController.swift
//  CustomAlert
//
//  Created by Ömer Oğuz Çelikel on 26.02.2023.
//

import UIKit

class ViewController: UIViewController, CustomAlertDelegate {
    //    let customAlert = CustomAlert()
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomAlert.shared.delegate = self
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        CustomAlert.shared.showAlert(in: self, photo: UIImage(named: "heart"), title: "My Alert Title", message: "This is my alert message.", numberOfButtons: 2, buttonTitles: ["OK", "Cancel"])
    }
    
    
    func customAlertDidTapButton(at index: Int) {
        if index == 0 {
            print("Ok button tapped")
        } else if index == 1 {
            print("Cancel button tapped")
        }
    }
    
    
    
}

