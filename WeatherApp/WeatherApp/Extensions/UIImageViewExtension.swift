//
//  UIImageViewExtension.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    public func setImageFromURL(string: String) {
        self.image = UIImage(named: "weather")
        guard let url = URL(string: "https:\(string)") else { return }
        
        Alamofire.request(url).responseData { (response) in
            guard let data = response.data else { return }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data)
                self.image = image
            })
        }
    }
}
