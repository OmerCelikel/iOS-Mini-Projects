//
//  ListViewController.swift
//  shareLink
//
//  Created by Ömer Oğuz Çelikel on 28.10.2023.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func updateShoppingList()
}

class ListViewController: UIViewController, ListViewControllerProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter = ListPresenter()
        presenter?.view = self
    }

    func updateShoppingList() {
        tableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Yeni Ürün Ekle", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Ürün Adı"
        }

        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Ekle", style: .default) { _ in
            if let newItem = alertController.textFields?.first?.text, !newItem.isEmpty {
                let shoppingItem = ShoppingItem(name: newItem)
                self.presenter?.addItem(shoppingItem)
            }
        }

        alertController.addAction(cancelAction)
        alertController.addAction(addAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    // ...
}


