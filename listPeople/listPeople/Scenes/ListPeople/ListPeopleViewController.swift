//
//  ListPeopleViewController.swift
//  listPeople
//
//  Created by Ömer Oğuz Çelikel on 18.12.2023.
//

import UIKit

protocol ListPeopleViewControllerProtocol: AnyObject {
    func emptyViewOn()
    func refreshTableView()
    func startOverUI()
    func showLoadingIndicator()
    func showAlert(with title: String, message: String)
    func tableEndRefreshing()
    func hideLoadingIndicator()
}

class ListPeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    var loadingIndicator: UIActivityIndicatorView?
    
    lazy var presenter: ListPeoplePresenterProtocol? = ListPeoplePresenter(view: self, router: ListPeopleRouter(viewController: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.fetchPeople()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        presenter?.fetchPeople()
    }
    
    //Start again with same peopleCount
    @IBAction func startOverButtonTapped(_ sender: Any) {
        presenter?.startOver()
    }
}

extension ListPeopleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberRowsIn(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        if let person = presenter?.viewModelForCellAt(indexPath: indexPath) {
            cell.textLabel?.text = String.formattedStringWithId(name: person.fullName, id: person.id)
        }
        return cell
    }
}


extension ListPeopleViewController: ListPeopleViewControllerProtocol {
    
    func refreshTableView() {
        tableView.reloadData()
    }
    
    func startOverUI() {
        emptyView.isHidden = true
        tableView.isHidden = false
    }
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: Strings.alertTryAgain, style: .default) { _ in
            self.presenter?.fetchPeople()
        }
        
        let cancelAction = UIAlertAction(title: Strings.alertCalcel, style: .cancel) {_ in
            self.hideLoadingIndicator()
        }
        
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    // Show empty view after a delay
    func emptyViewOn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.emptyView.isHidden = false
            self.emptyLabel.text = Strings.emptyListText
            self.tableView.isHidden = true
            self.presenter?.removeAllElementes()
            self.tableView.reloadData()
        }
    }
    
    func tableEndRefreshing() {
        self.tableView.refreshControl?.endRefreshing()

    }
    
    func showLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator?.center = view.center
        view.addSubview(loadingIndicator!)
        loadingIndicator?.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingIndicator?.stopAnimating()
        loadingIndicator?.removeFromSuperview()
        loadingIndicator = nil
    }
    
    
}
