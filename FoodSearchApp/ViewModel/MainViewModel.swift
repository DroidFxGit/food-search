//
//  MainViewModel.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

struct MainViewModel {
    fileprivate weak var datasource: GenericDatasource<Meal>?
    fileprivate let service: MealService
    
    init(datasource: GenericDatasource<Meal>?,
         service: MealService) {
        self.datasource = datasource
        self.service = service
    }
    
    func fetchRecipe(with query: String) {
        DispatchQueue.main.async {
            service.fetchMeal(with: query) { (response) in
                switch response {
                case .success(response: let value):
                    datasource?.data.value = value.meals
                case .failure(error: let error):
                    //TODO: handle error
                    print("error: \(error)")
                }
            }
        }
    }
    
    func clearData() {
        datasource?.data.value = []
    }
}
