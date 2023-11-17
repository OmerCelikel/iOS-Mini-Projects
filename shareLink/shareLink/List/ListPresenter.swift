//
//  ListPresenter.swift
//  shareLink
//
//  Created by Ömer Oğuz Çelikel on 28.10.2023.
//

import Foundation

protocol ListPresenterProtocol {
    var view: ListViewControllerProtocol? { get set }
    func addItem(_ item: ShoppingItem)
    func removeItem(at index: Int)
    func getShoppingList() -> [ShoppingItem]
}

class ListPresenter: ListPresenterProtocol {
    var view: ListViewControllerProtocol?
    private var shoppingList = [ShoppingItem]()

    func addItem(_ item: ShoppingItem) {
        shoppingList.append(item)
        view?.updateShoppingList()
    }

    func removeItem(at index: Int) {
        shoppingList.remove(at: index)
        view?.updateShoppingList()
    }

    func getShoppingList() -> [ShoppingItem] {
        return shoppingList
    }
}
