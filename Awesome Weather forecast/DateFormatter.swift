//
//  DateFormatter.swift
//  SkynetMobilePlatIT
//
//  Created by Julius on 12/4/18.
//  Copyright © 2018 RTL. All rights reserved.
//

import Foundation

enum _DateFormatters {
    
}

extension _DateFormatters {
    
    /// date formatter in format dd MMMM
    static var forDay: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter
    }()
    
    /// date formatter in format HH:mm
    static var forTime: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        return df
    }()
    
    /// date formatter in format YYYY-MM-dd HH:mm:ss
    static var forFullDateAndTime: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd HH:mm:ss"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }()
}
