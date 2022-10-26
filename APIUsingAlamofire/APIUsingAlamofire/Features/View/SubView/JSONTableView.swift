//
//  JSONTableView.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

import UIKit

protocol JSONTableViewProtocol {
    func update(items: [PostModel])
}
protocol JSONTableViewOutput: class {
    func onSelected(item: PostModel)
}

final class JsonTableView: NSObject{
    private lazy var items: [PostModel] = []
    
    /// JSON tableView Output Models
    weak var delegate: JSONTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.textLabel?.text = items[indexPath.row].body
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
}

extension JsonTableView: UITableViewDelegate, UITableViewDataSource { }
extension JsonTableView: JSONTableViewProtocol {
    func update(items: [PostModel]) {
        self.items = items
    }
}

