//
//  MainDataSourceConcrete.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import UIKit

final class MainDataSourceConcrete: GenericDatasource<Meal>, MainDatasource {
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    private let itemsPerRow: CGFloat = 1
    private let kHeightRow: CGFloat = 200
    private let kHeightFooter: CGFloat = 20
    
    var onAction: ((Meal) -> Void)?
    init(_ onAction: ((Meal) -> Void)? = nil) {
        self.onAction = onAction
        super.init()
    }
    
    func observe(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        data.addAndNotify(observer: self, completionHandler: completionHandler)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = RecipeMealCollectionViewCell.identifier
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                            for: indexPath) as? RecipeMealCollectionViewCell else {
            preconditionFailure("Cannot deque cell")
        }
        
        let model = data.value[indexPath.row]
        cell.configure(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = data.value[indexPath.row]
        onAction?(model)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: kHeightRow)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: kHeightFooter)
    }
}

