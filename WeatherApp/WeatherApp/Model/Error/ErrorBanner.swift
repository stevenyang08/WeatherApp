//
//  ErrorBanner.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit

final class ErrorBanner {
    
    static func displayErrorBanner(with code: ErrorCodes) {
        let alert = UIAlertController(title: code.errorDetails.title, message: code.errorDetails.body, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            Log.logger.error("ERROR: \(code.errorDetails.title, code.errorDetails.body)")
            UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
}
