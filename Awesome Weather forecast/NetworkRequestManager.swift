//
//  NetworkManagerV1.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

protocol NetworkRequestManager {
    
    func getForecast(latitude: Double, longitude: Double, time: TimeInterval?, params: [String: Any]?, then completion: @escaping NetworkCompletionHandler<ForecastResponse>)
    
}
