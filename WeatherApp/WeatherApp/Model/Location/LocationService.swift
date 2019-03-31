//
//  LocationService.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit
import CoreLocation

typealias LocationCompletion = (_ shouldRequest: Bool, _ enabled: Bool) -> ()

class LocationService {
    
    static let shared = LocationService()
    
    func getLocationStatus(completed: @escaping LocationCompletion) {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            completed(true, false)
        case .denied, .restricted:
            showAlert()
            completed(false, false)
        case .authorizedAlways, .authorizedWhenInUse:
            completed(false, true)
        }
        
        Log.logger.info("LocationManager was checked.")
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Location services must be enabled to use this feature.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        Log.logger.error("Locations Services error shown.")
    }
    
}
