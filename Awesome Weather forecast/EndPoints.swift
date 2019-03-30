//
//  EndPoints.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

enum EndPoints {
     static let baseUrlStr = "https://api.darksky.net/forecast/"
}

extension EndPoints {
    static func urlStringForForecast(latitude: Double, longitude: Double, time: TimeInterval? = nil) -> String {
        var url = "\(baseUrlStr)\(Constants.darkSkyApiKey)/\(latitude),\(longitude)"
        
        if let aTime = time {
            url.append(",\(Int(aTime))")
        }
        
        return url
    }
}
