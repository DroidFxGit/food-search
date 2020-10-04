//
//  MainSearchViewController.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import UIKit

class MainSearchViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func fetch(query: String) {
        viewModel.fetchRecipe(with: query)
    }
}

extension MainSearchViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.fetch(query:)), object: nil)
            self.perform(#selector(self.fetch(query:)), with: searchText, afterDelay: 0.5)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}
