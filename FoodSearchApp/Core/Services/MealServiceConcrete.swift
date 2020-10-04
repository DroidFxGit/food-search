//
//  MealServiceConcrete.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

final class MealServiceConcrete: BaseService<MealServiceResponseModel>, MealService {
    func fetchMeal(with query: String, _ completion: @escaping completionHandler<MealServiceResponseModel>) {
        guard let request = try? MealServiceRouter.fetchMeal(query).asURLRequest() else {
            completion(.failure(error: ServiceError.badrequest))
            return
        }
        perform(request: request, completion: completion)
    }
}
