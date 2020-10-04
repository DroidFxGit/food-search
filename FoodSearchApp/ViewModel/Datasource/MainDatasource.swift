//
//  MainDatasource.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import UIKit
import Foundation

protocol MainDatasource: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func observe(_ observer: NSObject, completionHandler: @escaping CompletionHandler)
}
