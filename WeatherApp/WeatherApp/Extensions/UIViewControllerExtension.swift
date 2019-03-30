//
//  UIViewControllerExtension.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit

extension UIViewController {
    func showLoading() {
        guard let customAlert = UINib(nibName: "CustomAlertLoadingView", bundle: nil).instantiate(withOwner: self, options: nil).first as? CustomAlertLoadingView else { return }
        customAlert.tag = 99999
        customAlert.loadingIndicator.startAnimating()
        
        let screen = UIScreen.main.bounds
        customAlert.center = CGPoint(x: screen.midX, y: screen.midY)
        
        self.view.addSubview(customAlert)
    }
    
    func hideLoading() {
        self.view.viewWithTag(99999)?.removeFromSuperview()
    }
}
