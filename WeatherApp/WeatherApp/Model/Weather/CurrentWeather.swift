//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    
    var lastUpdatedEpoch: Int
    var lastUpdated: String
    var tempCelcius: Double
    var tempFahrenheit: Double
    var isCurrentDay: Int
    var condition: Condition
    var windMph: Double
    var windKph: Double
    var windDegree: Int
    var windDirection: String
    var pressureMb: Double
    var pressureIN: Double
    var precipitationMM: Double
    var precipitationIN: Double
    var humidity: Double
    var cloud: Double
    var feelsLikeCelcius: Double
    var feelsLikeFahrenheit: Double
    var visibilityKM: Int
    var visibilityMiles: Int
    var uv: Int
    var gustMPH: Double
    var gustKPH: Double
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempCelcius = "temp_c"
        case tempFahrenheit = "temp_f"
        case isCurrentDay = "is_day"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDirection = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIN = "pressure_in"
        case precipitationMM = "precip_mm"
        case precipitationIN = "precip_in"
        case feelsLikeCelcius = "feelslike_c"
        case feelsLikeFahrenheit = "feelslike_f"
        case visibilityKM = "vis_km"
        case visibilityMiles = "vis_miles"
        case gustMPH = "gust_mph"
        case gustKPH = "gust_kph"
        case humidity = "humidity"
        case cloud = "cloud"
        case uv = "uv"
    }
    
}
