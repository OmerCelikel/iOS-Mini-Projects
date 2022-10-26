//
//  JSONPlaceHolderViewController.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

import UIKit

class JSONPlaceHolderViewController: UIViewController{

    @IBOutlet weak var JSONHolderTableView: UITableView!
    
    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPlaceHolderProtocol = JsonPlaceHoldeerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDelegate()
        initService()
        print("\n getComments: ")
        initGetService()
        
    }
    func initDelegate() {
        JSONHolderTableView.delegate = jsonTableView
        JSONHolderTableView.dataSource = jsonTableView
        jsonTableView.delegate = self
    }
        
    func initService() {
        jsonService.fetchAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.JSONHolderTableView.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
            
    }
    
    func initGetService() {
        jsonService.getComments { [weak self] (models) in
            print("data: ", models)
        } onFail: { (data) in
            print(data ?? "")
        }
            
    }

}

extension JSONPlaceHolderViewController: JSONTableViewOutput {
    func onSelected(item: PostModel) {
        print(item.body ?? "")
    }
    
    
}

