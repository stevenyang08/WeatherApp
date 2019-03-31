//
//  Location.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation

struct WeatherLocation: Codable {
    var name: String
    var region: String
    var country: String
    var latitude: Double
    var longitude: Double
    var tzId: String
    var localTimeEpoch: Int
    var localTime: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case latitude = "lat"
        case longitude = "lon"
        case tzId = "tz_id"
        case localTimeEpoch = "localtime_epoch"
        case localTime = "localtime"
    }
    
}
