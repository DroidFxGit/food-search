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
    lazy var mealService: MealService = {
        return MealServiceConcrete()
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window?.makeKeyAndVisible()
        configureMainView()
    }
    
    func configureMainView() {
        let datasource = MainDataSourceConcrete { _ in
            //TODO: here launch details view
        }
        
        let viewModel = MainViewModel(datasource: datasource, service: mealService)
        
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
        mainSearchView.viewModel = viewModel
        mainSearchView.datasource = datasource
        
        rootController.viewControllers = [mainSearchView]
        rootController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = rootController
    }
}
