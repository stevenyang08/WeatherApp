//
//  ForecastDetailsViewController.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit

class ForecastDetailsViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var weatherBackgroundImage: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var averageTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var maxWindSpeedLabel: UILabel!
    @IBOutlet weak var totalPrecipitationLabel: UILabel!
    @IBOutlet weak var averageVisibilityLabel: UILabel!
    @IBOutlet weak var averageHumidityLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var moonriseLabel: UILabel!
    @IBOutlet weak var moonsetLabel: UILabel!
    
    //Variables
    var forecast: ForecastDay!
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //Functions
    private func setupView() {
        let date = Date(timeIntervalSince1970: Double(forecast.dateEpoch))
        title = dateFormatter.string(from: date)
        weatherBackgroundImage.image = UIImage(named: "\(forecast.day.condition.code)f")
        conditionLabel.text = forecast.day.condition.text
        averageTempLabel.text = "\(forecast.day.averageTempFahrenheit)º F"
        minimumTempLabel.text = "\(forecast.day.minTempFahrenheit)º F"
        maximumTempLabel.text = "\(forecast.day.maxTempFahrenheit)º F"
        maxWindSpeedLabel.text = "\(forecast.day.maxWindMph) MPH"
        totalPrecipitationLabel.text = "\(forecast.day.totalPrecipitationMM) MM"
        averageVisibilityLabel.text = "\(forecast.day.averageVisibilityMiles) mi"
        averageHumidityLabel.text = "\(forecast.day.averageHumidity)%"
        sunriseLabel.text = forecast.astro.sunrise
        sunsetLabel.text = forecast.astro.sunset
        moonriseLabel.text = forecast.astro.moonrise
        moonsetLabel.text = forecast.astro.moonset
        
        Log.logger.info("ForecastDetailsViewController called setup.r")
    }
}
