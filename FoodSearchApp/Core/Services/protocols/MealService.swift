//
//  MealService.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

protocol MealService: AnyObject {
    func fetchMeal(with query: String, _ completion: @escaping completionHandler<MealServiceResponseModel>)
}
