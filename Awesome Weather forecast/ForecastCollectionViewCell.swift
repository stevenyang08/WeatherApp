//
//  ForecastCollectionViewCell.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import UIKit

class ForecastCollectionViewCell: NibCollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    @IBOutlet weak var apparentValueLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        temperatureValueLabel.text = nil
        apparentValueLabel.text = nil
        sunriseTimeLabel.text = nil
        sunsetTimeLabel.text = nil
        iconImageView.image = nil
    }
    
    func cofigureWith(forecastItem item: ForecastItem){
        
        dateLabel.text = item.time.flatMap({ _DateFormatters.forDay.string(from: $0) })
        
        temperatureValueLabel.text = item.tempretureHighAndLowString
        apparentValueLabel.text = item.apparentTempretureHighAndLowString
        
        sunsetTimeLabel.text = item.sunsetTime.flatMap({ _DateFormatters.forTime.string(from: $0) })
        sunriseTimeLabel.text = item.sunriseTime.flatMap({ _DateFormatters.forTime.string(from: $0) })
        
        iconImageView.image = item.icon.flatMap({ UIImage(named: $0) })
    }
    
    private func setupUI(){
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
        
        layer.borderColor = #colorLiteral(red: 0.9550513699, green: 0.9407641267, blue: 0.9418075771, alpha: 1).cgColor
        layer.borderWidth = 1.0
    }
    
}
