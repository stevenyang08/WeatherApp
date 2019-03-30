//
//  ForecastInfo.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation

struct ForecastInfo: Decodable{
    let summary, icon: String?
    let data: [ForecastItem]?
}
