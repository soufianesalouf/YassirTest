//
//  LoadableImageView.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import UIKit

// MARK: - Image Cache

let imageCache = NSCache<AnyObject, AnyObject>()

// MARK: - LoadableImageView

class LoadableImageView: UIImageView {
    
    // MARK: - Properties
    
    private var imageUrlString: String?
    
    // MARK: - Methods
    
    func loadImageUsing(urlString: String, completion: (()->())?) {
        
        guard let url = URL(string: urlString) else {
            completion?()
            return
        }
        
        imageUrlString = urlString
        image = nil
        
        // Check if the image already cached
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            completion?()
            return
        }
        
        // Load the image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let data = data else {
                    self.image = UIImage(named: "imagePlaceholder")
                    completion?()
                    return
                }
                
                // Cache the loaded image and cache it using its url as the key
                var imageToCache = UIImage(data: data)
                
                // Check if the finished image is the same who started loading
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                // Make sure to set an image if image to cache is nil
                if imageToCache == nil {
                    imageToCache = UIImage(named: "imagePlaceholder")
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                completion?()
            }
        }).resume()
    }
}
