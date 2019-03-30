//
//  ForecastDayDetailCollectionViewCell.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class ForecastDayDetailCollectionViewCell: NibCollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        timeLabel.text = nil
        temperatureValueLabel.text = nil
    }
    
    func cofigureWith(forecastItem item: ForecastItem){
        timeLabel.text = item.time.flatMap({ _DateFormatters.forTime.string(from: $0) })
        temperatureValueLabel.text = item.temperatureString
        iconImageView.image = item.icon.flatMap({ UIImage(named: $0) })
    }
    
    private func setupUI(){
        layer.masksToBounds = true
        layer.cornerRadius = 9.0
        
        layer.borderColor = #colorLiteral(red: 0.9550513699, green: 0.9407641267, blue: 0.9418075771, alpha: 1).cgColor
        layer.borderWidth = 1.0
    }
    
}
