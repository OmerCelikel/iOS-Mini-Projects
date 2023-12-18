//
//  ListPeoplePresenter.swift
//  listPeople
//
//  Created by Ömer Oğuz Çelikel on 18.12.2023.
//

import Foundation

protocol ListPeoplePresenterProtocol {
    func numberRowsIn(section: Int) -> Int
    func viewModelForCellAt(indexPath: IndexPath) -> Person?
    func fetchPeople()
    func removeAllElementes()
    func handleFetchResponse(_ response: FetchResponse)
    func startOver()
}

class ListPeoplePresenter {
    
    var displayedPeople: [Person] = []
    var nextIdentifier: String?
    var isFinished: Bool = false
    
    weak var view: ListPeopleViewControllerProtocol?
    var router: ListPeopleRouterProtocol?
    
    init(view: ListPeopleViewControllerProtocol?, router: ListPeopleRouterProtocol?) {
        self.view = view
        self.router = router
    }
    
}

extension ListPeoplePresenter: ListPeoplePresenterProtocol {
    
    func numberRowsIn(section: Int) -> Int {
        return displayedPeople.count
    }
    
    func viewModelForCellAt(indexPath: IndexPath) -> Person? {
        guard indexPath.row < displayedPeople.count else { return nil }
        return displayedPeople[indexPath.row]
    }
    
    func fetchPeople() {
        if !isFinished {
            DataSource.fetch(next: nextIdentifier) { response, error in
                self.updateUI(with: response, error: error)
            }
        } else {
            // Show empty view if no more data
            view?.emptyViewOn()
        }
    }
    
    func updateUI(with response: FetchResponse?, error: FetchError?) {
        DispatchQueue.main.async {
            if let error = error {
                // Show loading indicator and display alert on error
                self.view?.showLoadingIndicator()
                self.view?.showAlert(with: Strings.alertTitle, message: "\(error.errorDescription). \(Strings.alertTryAgain)")
            } else if let response = response {
                // Hide loading indicator and handle fetch response
                self.view?.tableEndRefreshing()
                self.view?.hideLoadingIndicator()
                self.handleFetchResponse(response)
            }
        }
    }
    
    func handleFetchResponse(_ response: FetchResponse) {
        //List people on new page
        displayedPeople.removeAll()
        if (response.next == nil) {
            isFinished = true
        }
        
        displayedPeople.append(contentsOf: response.people)
        nextIdentifier = response.next
        view?.refreshTableView()
    }
    
    func removeAllElementes() {
        displayedPeople.removeAll()
    }
    
    func startOver() {
        isFinished = false
        fetchPeople()
        view?.startOverUI()
    }
}
