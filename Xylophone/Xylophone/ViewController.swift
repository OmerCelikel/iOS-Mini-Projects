//
//  ViewController.swift
//  Xylophone
//
//  Created by Ömer Oğuz Çelikel on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print("Color \(String(describing: sender.backgroundColor))")
        //        switch sender.tag {
        //        case 1:
        //            print("a")
        //        case 2:
        //            print("b")
        //        case 3:
        //            print("c")
        //        default:
        //            break
        //        }
        
        switch sender.titleLabel?.text{
        case "A":
            print("a")
        case "B":
            print("b")
        case "C":
            print("c")
        default:
            break
        }
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        
    }
    

}

