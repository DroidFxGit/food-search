//
//  RecipeMealCollectionViewCell.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import UIKit

class RecipeMealCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "recipeMealIdentifier"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ model: Meal) {
        configureAppearance()
        
        let url = URL(fileURLWithPath: model.strMealThumb)
        imageView.imageFromUrl(url: url)
        nameLabel.text = model.strMeal
        categoryLabel.text = model.strCategory
    }
    
    private func configureAppearance() {
        containerView.layer.cornerRadius = 8.0
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 2.0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }

}
