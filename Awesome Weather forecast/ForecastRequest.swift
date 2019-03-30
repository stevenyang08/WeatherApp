//
//  ForecastRequest.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

struct ForecastRequest: Encodable {
    let units: Units = .si
    let language: Language = .en
    let exclude: [ForecastTypes]
    
    enum CodingKeys: String, CodingKey {
        case units
        case exclude
        case language = "lang"
    }
}

extension ForecastRequest {
    enum Units: String, Codable {
        case si
        case auto
        case us
    }
}

extension ForecastRequest {
    enum Language: String, Codable {
        case en
        case uk
        case ru
        case es
    }
}

extension ForecastRequest {
    enum ForecastTypes: String, Codable {
        case currently
        case minutely
        case hourly
        case daily
        case alerts
        case flags
    }
}

extension ForecastRequest {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(units, forKey: .units)
        try container.encode(language, forKey: .language)
        
        if !exclude.isEmpty {
            let excludeStr = exclude.map({ $0.rawValue }).joined(separator: ", ")
            try container.encode(excludeStr, forKey: .exclude)
        }
    }
    
}
