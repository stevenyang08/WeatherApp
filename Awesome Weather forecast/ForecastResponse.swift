//
//  ForecastResponse.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

struct ForecastResponse: Decodable {
    let latitude, longitude: Double?
    let timezone: String?
    let currently: ForecastInfo?
    let hourly: ForecastInfo?
    let daily: ForecastInfo?
    let offset: Int?
}
