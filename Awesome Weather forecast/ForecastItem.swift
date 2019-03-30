//
//  ForecastItem.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

struct ForecastItem: Decodable {
    let time: Date?
    let summary, icon: String?
    let sunriseTime, sunsetTime: Date?
    let temperature: Double?
    let moonPhase: Double?
    let precipIntensity: Double?
    let precipIntensityMax: Double?
    let precipIntensityMaxTime, precipProbability: Double?
    let temperatureHigh: Double?
    let temperatureHighTime: Double?
    let temperatureLow: Double?
    let temperatureLowTime: Double?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Double?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Double?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windGustTime, windBearing: Double?
    let cloudCover: Double?
    let uvIndex, uvIndexTime: Double?
    let visibility, ozone, temperatureMin: Double?
    let temperatureMinTime: Double?
    let temperatureMax: Double?
    let temperatureMaxTime: Double?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Double?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Double?
}

extension ForecastItem {
    
    var tempretureHighAndLowString: String? {
        return Temperatures(high: temperatureHigh,
                            low: temperatureLow).stringValue
    }
    
    var apparentTempretureHighAndLowString: String? {
        return Temperatures(high: apparentTemperatureHigh,
                            low: apparentTemperatureLow).stringValue
    }
    
    var temperatureString: String?{
        return temperature.flatMap({ String(format:"%.0f",$0) })
    }
    
}


extension ForecastItem {
    struct Temperatures {
        let high: Double?
        let low: Double?
        
        var stringValue: String? {
            return [high, low]
                .compactMap({ $0 })
                .map({ String(format:"%.0f",$0) })
                .joined(separator: "   ")
        }
    }
}
