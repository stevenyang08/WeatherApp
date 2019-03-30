//
//  Router.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit


class Router {
    
    var rootNavigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    
    func openDayForecast(for location: ForecastViewController.ForecastLocation, time: TimeInterval) {
        
        let assembly = ForecastForDayViewControllerAssebly(location: location, time: time)
        let viewController = assembly.assembly()
        
        rootNavigationController?.show(viewController, sender: nil)
    }
    
    
}
