//
//  Forecast.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    var forecastDay: [ForecastDay]?
    
    enum CodingKeys: String, CodingKey {
        case forecastDay = "forecastday"
    }
}

struct ForecastDay: Codable {
    var date: String?
    var dateEpoch: Int?
    var day: Day?
    var astro: Astro?
}

struct Day: Codable {
    
    var maxTempCelcius: Double?
    var minTempCelcius: Double?
    var maxTempFahrenheit: Double?
    var minTempFahrenheit: Double?
    var averageTempCelcius: Double?
    var averageTempFahrenheit: Double?
    var maxWindMph: Double?
    var maxWindKph: Double?
    var totalPrecipitationMM: Double?
    var totalPrecipitationIN: Double?
    var averageVisibilityKM: Double?
    var averageVisibilityMiles: Double?
    var averageHumidity: Double?
    var condition: Condition?
    var uv: Double?
    
    enum CodingKeys: String, CodingKey {
        case maxTempCelcius = "maxtemp_c"
        case minTempCelcius = "mintemp_c"
        case maxTempFahrenheit = "maxtemp_f"
        case minTempFahrenheit = "mintemp_f"
        case averageTempCelcius = "avgtemp_c"
        case averageTempFahrenheit = "avgtemp_f"
        case maxWindMph = "maxwind_mph"
        case maxWindKph = "maxwind_kph"
        case totalPrecipitationMM = "totalprecip_mm"
        case totalPrecipitationIN = "totalprecip_in"
        case averageVisibilityKM = "avgvis_km"
        case averageVisibilityMiles = "avgvis_miles"
        case averageHumidity = "avghumidity"
    }
    
}

struct Condition: Codable {
    var text: String?
    var icon: String?
    var code: Int?
}

struct Astro: Codable {
    var sunrise: String?
    var sunset: String?
    var moonrise: String?
    var moonset: String?
}
