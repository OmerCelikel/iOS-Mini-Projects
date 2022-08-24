//
//  ViewController.swift
//  viewHierarchy
//
//  Created by Ömer Oğuz Çelikel on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {

//    override func loadView() {
//        print("1 - loadView")
//    }
    
    override func loadViewIfNeeded() {
        print("First page 2 -loadViewIfNeeded")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("First page 3 -viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First page 4 -viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        print("First page 5 -viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First page 6 -viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First page 7 -viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First page 8 -viewDidDisappear")
    }
    
    
    
//    loadView()
//
//    loadViewIfNeeded()
//
//    viewDidLoad()
//
//    viewWillAppear(_ animated: Bool)
//
//    viewWillLayoutSubviews()
//
//    viewDidLayoutSubviews()
//
//    viewDidAppear(_ animated: Bool)
//
//    viewWillDisappear(_ animated: Bool)
//
//    viewDidDisappear(_ animated: Bool)


}

