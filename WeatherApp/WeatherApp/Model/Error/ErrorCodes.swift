//
//  ErrorCodes.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import Foundation

enum ErrorCodes {
    case genericError
    
    var errorDetails: (title: String, body: String) {
        switch self {
        case .genericError:
            return ("An error has occured.", "Please try again later.")
        }
    }
    
}
