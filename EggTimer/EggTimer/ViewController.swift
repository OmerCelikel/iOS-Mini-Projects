//
//  ViewController.swift
//  EggTimer
//
//  Created by Ömer Oğuz Çelikel on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var eggTitleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var secondsRemaining = 60
    let eggTimes = ["Soft": 3, "Medium" : 5,"Hard": 7]
    var timer = Timer()
    
    @IBAction func kivamButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        progressView.progress = 1.0
        if let myTitle = sender.titleLabel?.text {
            print("Buton başlığı: \(String(describing: myTitle))")
            secondsRemaining = eggTimes[myTitle]!
            }
        
        
        eggTitleLabel.text = sender.titleLabel?.text

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            print("\(secondsRemaining) seconds")
            eggTitleLabel.text = "DONE!"
        }
    }
}

