//
//  LinksDashboardViewController.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import UIKit

protocol LinksDashboardViewControllerProtocol: AnyObject { }

class LinksDashboardViewController: UIViewController {
    
    @IBOutlet weak var linkTableView: UITableView!
    
    lazy var presenter: LinksDashboardPresenterProtocol? = LinksDashboardPresenter(view: self, router: LinksDashboardRouter(viewController: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let linkItems = presenter?.linkItems {
            linkTableView.dataSource = self
            linkTableView.delegate = self
        }
    }
    
}

extension LinksDashboardViewController: LinksDashboardViewControllerProtocol { }

extension LinksDashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.linkItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "linkItemCell", for: indexPath) as! LinkItemTableViewCell
        
        if let linkItem = presenter?.linkItems[indexPath.row] {
            cell.configure(with: linkItem)
        }
        
        return cell
    }
    
}
