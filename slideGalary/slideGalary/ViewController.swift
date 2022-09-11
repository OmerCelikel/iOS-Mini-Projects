//
//  ViewController.swift
//  slideGalary
//
//  Created by Ömer Oğuz Çelikel on 7.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationItem.title = "Ek İş Kaydı"
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewControllerTableViewCell") as! ViewControllerTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewControllerTableViewCell2") as! ViewControllerTableViewCell
            return cell
        }
    }
    
    // Row Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let additionalWorkOrdersDetailViewController = storyboard.instantiateViewController(withIdentifier: "ekISVC") as! myTaskViewController
       
        
        self.showDetailViewController(additionalWorkOrdersDetailViewController, sender: nil)
    }
}


