//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation
import Alamofire

typealias WeatherCompletion = (_ : Weather?) -> ()

/// WeatherService: Class that will make calls to get the weather.
final class WeatherService {
    
    
    /// Query https://www.apixu.com for weather service.
    ///
    /// - Parameters:
    ///   - query: The Zip Code being used in the query.
    ///   - completed: The weather object being returned.
    static func getWeather(query: String, completed: @escaping WeatherCompletion) {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as? String, let weatherUrl = URL(string: "https://api.apixu.com/v1/forecast.json?key=\(apiKey)&q=\(query)&days=10") else {
            completed(nil)
            return
        }
        
        Alamofire.request(weatherUrl).responseJSON { (response) in
            guard let json = response.data else {
                completed(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: json)
                completed(weather)
            } catch let error {
                Log.logger.error("Failed to parse Weather, response: \(error)")
                completed(nil)
            }
            Log.logger.info("API Request made.")
        }
    }
    
}
