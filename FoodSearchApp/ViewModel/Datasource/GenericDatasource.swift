//
//  GenericDatasource.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation

class GenericDatasource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
