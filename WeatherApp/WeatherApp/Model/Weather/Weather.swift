//
//  Forecast.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var location: WeatherLocation?
    var current: CurrentWeather?
    var forecast: Forecast?
}

