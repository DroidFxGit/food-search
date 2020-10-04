//
//  UIImageView+Extensions.swift
//  FoodSearchApp
//
//  Created by Carlos Vazquez on 04/10/20.
//

import UIKit

extension UIImageView {
    func imageFromUrl(url: URL, placeholderImage: String? = nil) {
        let temporalImage = UIImage(named: placeholderImage ?? "")
        self.image = temporalImage
        downloadImageFromUrl(url: url) { image in
            self.image = image
        }
    }
    
    private func downloadImageFromUrl(url: URL, completion: @escaping (_ image: UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() {
                completion(image)
            }
        }.resume()
    }
}
