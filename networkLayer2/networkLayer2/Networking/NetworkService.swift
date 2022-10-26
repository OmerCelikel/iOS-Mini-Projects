//
//  NetworkService.swift
//  networkLayer2
//
//  Created by Ömer Oğuz Çelikel on 21.10.2022.
//

import Foundation

struct NetworkService {
    // route for path
    // method for type of request (get, post, delete...)
    // parameters: get request
    
    static let shared = NetworkService()
    // can not create funtion else where
    
    private init () {}
    
    func helloWorldAPI() {
        request2(route: .helloWord, method: .get, type: String.self, completion: { _ in })
    }
    
//    func myFirstRequest(completion: @escaping(Result<[Dish], Error>) -> Void) {
//        request(route: .temp, method: .get, completion: completion)
//    }
    
//    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
//        request(route: .fetchAllCategories, method: .get, completion: completion)
//    }
    
    func login(email: String?, password: String, completion: @escaping(Result<ResponseLogin, Error>) -> Void) {
        //request(route: .login(email: email, password: password), method: .post, completion: completion)
        request(route: .login, method: .post, parameters: ["email" : email, "password": password], completion: completion)
    }
    
    private func request2<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     type: T.Type,
                                     completion: (Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]?,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            } else if let error = error {
                print("result is error???\n")
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
                
            } else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    // command + option + \
    /// This function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: the path recource in backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        // https://yummie.glitch.me/temp
        
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
