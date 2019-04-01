//
//  UIViewExtension.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit

/// MARK - UIView Extension helper functions
extension UIView {
    func addGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        
        if let layers = self.layer.sublayers {
            for layer in layers where layer.name == "gradient" {
                layer.removeFromSuperlayer()
            }
        }
        
        gradient.name = "gradient"
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
