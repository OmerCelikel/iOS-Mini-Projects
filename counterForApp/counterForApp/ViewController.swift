//
//  ViewController.swift
//  counterForApp
//
//  Created by Ömer Oğuz Çelikel on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterUILabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = UserDefaults.standard
        var counterOpen = d.integer(forKey: "counterOpen")
        counterOpen = counterOpen + 1
        d.set(counterOpen, forKey: "counterOpen")
        counterUILabel.text = "\(counterOpen) Times Opened"
    }


}

