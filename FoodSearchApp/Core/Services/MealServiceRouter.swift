//
//  MealServiceRouter.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

typealias Parameters = [String: Any]?

enum MealServiceRouter: URLRequestConvertible {
    case fetchMeal(_ query: String)
    
    var mainURL: URL {
        return URL(fileURLWithPath: "https://www.themealdb.com/api/json/v1/1")
    }
    
    var parameters: Parameters {
        switch self {
        case .fetchMeal(let query):
            return ["s": query]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .fetchMeal:
            let path = "/search.php"
            return request(baseURL: mainURL, path: path, method: .get, parameters: parameters)
        }
    }
    
    fileprivate func request(baseURL: URL, path: String, method: HttpMethod, parameters: Parameters = nil) -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
        components.queryItems = parameters?.map({ (key, value) -> URLQueryItem in
            return URLQueryItem(name: key, value: "\(value)")
        })
        
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
