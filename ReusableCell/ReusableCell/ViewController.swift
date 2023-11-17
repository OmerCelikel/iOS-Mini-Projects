//
//  ViewController.swift
//  ReusableCell
//
//  Created by Ömer Oğuz Çelikel on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var usersArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"]
    var selectedCellIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        
        cell.textLabel?.text = usersArray[indexPath.row]
        // Hücrenin arka plan rengini kontrol et
        if selectedCellIndex == indexPath {
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.textColor = .black
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Eğer aynı hücreye tekrar tıklanırsa, rengini değiştirme
        if selectedCellIndex == indexPath {
            // Hücrenin metin rengini eski haline getir
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel?.textColor = .black
            }
            selectedCellIndex = nil
        } else {
            // Daha önce seçili hücrenin rengini eski haline getir
            if let selectedCellIndex = selectedCellIndex, let cell = tableView.cellForRow(at: selectedCellIndex) {
                cell.textLabel?.textColor = .black
            }
            
            // Yeni seçilen hücrenin indeksini sakla
            selectedCellIndex = indexPath
            
            // Seçili hücrenin metin rengini kırmızı yap
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel?.textColor = .red
            }
        }
    }
    
}
