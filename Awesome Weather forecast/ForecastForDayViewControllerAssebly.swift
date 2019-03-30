//
//  ForecastForDayViewControllerAssebly.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class ForecastForDayViewControllerAssebly: ViewControllerAssebly {
    private var location: ForecastViewController.ForecastLocation
    private var time: TimeInterval
    
    init(location: ForecastViewController.ForecastLocation, time: TimeInterval) {
        self.location = location
        self.time = time
    }
    
    func assembly() -> ForecastForDayViewController {
        let layout = ForecastCollectionViewLayout()
        
        layout.colums = 3
        
        let viewController = ForecastForDayViewController(collectionViewLayout: layout)
        viewController.location = location
        viewController.time = time
        viewController.requestModel = ForecastRequest(exclude:[.alerts, .currently,.flags,.daily,.minutely])
        return viewController
    }
    
}
