//
//  ForecastViewControllerAssembly.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class ForecastViewControllerAssembly: ViewControllerAssebly {
    private var location: ForecastViewController.ForecastLocation
    private var time: TimeInterval?
    
    init(location: ForecastViewController.ForecastLocation, time: TimeInterval? = nil) {
        self.location = location
        self.time = time
    }
    
    func assembly() -> ForecastViewController {
        let layout = ForecastCollectionViewLayout()

        let viewController = ForecastViewController(collectionViewLayout: layout)
        viewController.location = location
        viewController.time = time
        viewController.requestModel = ForecastRequest(exclude:[.alerts, .currently,.flags,.hourly,.minutely])
        return viewController
    }
    
}
