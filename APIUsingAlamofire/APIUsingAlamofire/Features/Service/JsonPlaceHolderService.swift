//
//  JsonPlaceHolderService.swift
//  APIUsingAlamofire
//
//  Created by Ömer Oğuz Çelikel on 25.10.2022.
//

import Alamofire

protocol JsonPlaceHolderProtocol {
    func fetchAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void)
    func getComments(onSuccess: @escaping ([Comment]) -> Void, onFail: @escaping (String?) -> Void)
    
}
enum JsonPlaceHolderPath: String {
    //case BASE_URL = ""
    case POSTS = "/posts"
    case GET_COMMENT = "/posts/1/comments"
}

extension JsonPlaceHolderPath {
    func withBaseUrl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

struct JsonPlaceHoldeerService: JsonPlaceHolderProtocol {
    func fetchAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POSTS.withBaseUrl(), method: .get).validate().responseDecodable(of: [PostModel].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func getComments(onSuccess: @escaping ([Comment]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.GET_COMMENT.withBaseUrl(), method: .get).validate().responseDecodable(of: [Comment].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
