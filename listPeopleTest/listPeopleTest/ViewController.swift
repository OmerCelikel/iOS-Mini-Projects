//
//  ViewController.swift
//  listPeopleTest
//
//  Created by Ömer Oğuz Çelikel on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    var displayedPeople: [Person] = []
    var nextIdentifier: String?
    var isFinished: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchPeople()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        fetchPeople()
    }
    
    func fetchPeople() {
        DataSource.fetch(next: nextIdentifier) { response, error in
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                if self.isFinished {
                    self.emptyViewOn()
                }
                if let error = error {
                    // print("Error: \(error.localizedDescription)")
                    self.retryFetch()
                } else if let response = response {
                    self.handleFetchResponse(response)
                }
            }
        }
    }
    
    func handleFetchResponse(_ response: FetchResponse) {
        displayedPeople.removeAll()
        if (response.next == nil) {
            isFinished = true
        }
        
        displayedPeople.append(contentsOf: response.people)
        nextIdentifier = response.next
        tableView.reloadData()
    }
    
    
    func retryFetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.fetchPeople()
        }
    }
    
    func emptyViewOn() {
        emptyView.isHidden = false
        emptyLabel.text = Strings.emptyListText
        tableView.isHidden = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = displayedPeople[indexPath.row]
        cell.textLabel?.text = person.formattedFullNameWithId
        
        return cell
    }
}


