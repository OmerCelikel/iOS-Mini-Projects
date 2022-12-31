//
//  APIManager.swift
//  APICallingUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 28.10.2022.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    func callingLoginAPI(userLogin: RequestUserLogin) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(loginURL, method: .post, parameters: userLogin, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                } catch  {
                    print("catch: ",error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        
        }
    }
}
