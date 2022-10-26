//
//  ViewController.swift
//  onurPhoneTest
//
//  Created by Ömer Oğuz Çelikel on 15.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "Hello Selim"
    }

    @IBAction func buttonTapped(_ sender: Any) {
        textLabel.text = "Cükü KÜÇÜK SELİM"
    }
    
}

