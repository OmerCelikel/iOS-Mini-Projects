//
//  ViewController.swift
//  alamofireGiris
//
//  Created by Ömer Oğuz Çelikel on 4.09.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func kisiEkle() {
        let parametreler:Parameters = ["kisi_ad":"TESTALAMOFIRE","kisi_tel":"999999"]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php" , method: .post , parameters: parametreler).responseDecodable { respons in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}

