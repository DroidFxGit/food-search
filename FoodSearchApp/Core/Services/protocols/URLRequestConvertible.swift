//
//  URLRequestConvertible.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}
