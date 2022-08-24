//
//  SecondPageViewController.swift
//  viewHierarchy
//
//  Created by Ömer Oğuz Çelikel on 24.08.2022.
//

import UIKit

class SecondPageViewController: UIViewController {
//    override func loadView() {
//        print("Second page 1 - loadView")
//    }
    override func loadViewIfNeeded() {
        print("Second page 2 -loadViewIfNeeded")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second page 3 -viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second page 4 -viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        print("Second page 5 -viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Second page 6 -viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Second page 7 -viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Second page 8 -viewDidDisappear")
    }
    
    
    
}
