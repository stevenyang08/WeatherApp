//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackgroundImage: UIImageView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    
    //Variables
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBackgroundImage.clipsToBounds = true
        cellBackgroundImage.layer.cornerRadius = 8
    }
    
    
    /// Set's the cell's data with the provided ForecastDay object.
    ///
    /// - Parameter forecast: A ForecastDay object with the details of the day's weather.
    func set(forecast: ForecastDay) {
        dateLabel.text = dateFormatter.string(from: forecast.date)
        cellBackgroundImage.image = UIImage(named: "\(forecast.day.condition.code)f")
        weatherImage.image = UIImage(named: "\(forecast.day.condition.code)")
        currentTempLabel.text = "\(forecast.day.averageTempFahrenheit)º F"
        minimumTempLabel.text = "Min: \(forecast.day.minTempFahrenheit)º F"
        maximumTempLabel.text = "Max: \(forecast.day.maxTempFahrenheit)º F"
        
        Log.logger.info("Cell Data was set.")
    }
    
}
