//
//  JsonPlaceHoldeerService.swift
//  testAPIwAF
//
//  Created by Ömer Oğuz Çelikel on 15.11.2022.
//

import Foundation
import Alamofire


protocol JsonPlaceHolderProtocol {
    func fetchAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void)
    func callingLoginAPI(userLogin: RequestUserLogin, completionHandler: @escaping Handler)
    func getSkillCount(onSuccess: @escaping ([ResponseSkillCount]) -> Void, onFail: @escaping (String?) -> Void)
    
}
enum JsonPlaceHolderPath: String {
    //case BASE_URL = ""
    case POSTS = "/posts"
    case LOGIN_URL = "/User/Login"
}

extension JsonPlaceHolderPath {
    func withBaseUrl() -> String {
        return "http://testapi-do-veloper.fw.dteknoloji.com.tr/api\(self.rawValue)"
    }
}

struct JsonPlaceHoldeerService: JsonPlaceHolderProtocol {
    
    let userDefault = UserDefaults.standard
    
    func fetchAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POSTS.withBaseUrl(), method: .get).validate().responseDecodable(of: [PostModel].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func getSkillCount(onSuccess: @escaping ([ResponseSkillCount]) -> Void, onFail: @escaping (String?) -> Void) {
        guard let token = userDefault.object(forKey: TokenKey.userLogin) as? String else {
            return
        }
        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]
        AF.request(JsonPlaceHolderPath.POSTS.withBaseUrl(), method: .get, headers: headers).validate().responseDecodable(of: [ResponseSkillCount].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func callingLoginAPI(userLogin: RequestUserLogin, completionHandler: @escaping Handler) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(JsonPlaceHolderPath.LOGIN_URL.withBaseUrl(), method: .post, parameters: userLogin, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ResponseUserLogin.self, from: data!)
                    if response.response?.statusCode == 200 {
                        completionHandler(.success(json))
                    } else {
                        completionHandler(.failure(.custom(message: "Check network")))
                    }
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "Try again")))
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "Try again")))
            }
        
        }
    }
    
}


