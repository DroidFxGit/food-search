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
    var datasource: MainDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource.observe(self) { [weak self] in
            guard let strongSelf = self else { fatalError("ViewController not found") }
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
    @objc func fetch(query: String) {
        viewModel.fetchRecipe(with: query)
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(UINib(nibName: "RecipeMealCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: RecipeMealCollectionViewCell.identifier)
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
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
        viewModel.clearData()
    }
}
