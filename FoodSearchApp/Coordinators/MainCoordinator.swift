//
//  MainCoordinator.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import Foundation
import UIKit

final class MainCoordinator: Startable {
    fileprivate weak var window: UIWindow?
    var rootController: UINavigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window?.makeKeyAndVisible()
        configureMainView()
    }
    
    func configureMainView() {
        let mainSearchView = MainSearchViewController()
        mainSearchView.title = "Food Recipes"
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchBar.delegate = mainSearchView
        searchVC.delegate = mainSearchView
        searchVC.hidesNavigationBarDuringPresentation = true
        searchVC.obscuresBackgroundDuringPresentation = false
        mainSearchView.navigationItem.searchController = searchVC
        mainSearchView.definesPresentationContext = true
        mainSearchView.searchController = searchVC
        
        rootController.viewControllers = [mainSearchView]
        rootController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = rootController
    }
}
