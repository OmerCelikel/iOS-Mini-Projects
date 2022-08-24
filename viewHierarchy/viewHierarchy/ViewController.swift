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
        print("2 -loadViewIfNeeded")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3 -viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("4 -viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        print("5 -viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("6 -viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("7 -viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("8 -viewDidDisappear")
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

