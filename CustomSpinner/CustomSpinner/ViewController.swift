//
//  ViewController.swift
//  CustomSpinner
//
//  Created by Ömer Oğuz Çelikel on 27.02.2023.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startSpinner(_ sender: UIButton) {
        CustomSpinner.shared.showSpinner(on: self.view)
        
        // Simulate some background task
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            CustomSpinner.shared.removeSpinner(on: self.view)
        }
    }
    
    @IBAction func stopSpinner(_ sender: UIButton) {
        CustomSpinner.shared.removeSpinner(on: self.view)
    }
    
    
    
}

