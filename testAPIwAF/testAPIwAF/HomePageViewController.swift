//
//  HomePageViewController.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    private let jsonService: JsonPlaceHolderProtocol = JsonPlaceHoldeerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGetService()
    }    
    func initGetService() {
        jsonService.getSkillCount { [weak self] (models) in
            print("getSkillCount: ", models)
        } onFail: { (data) in
            print(data ?? "")
        }
    }

}
