//
//  ForecastDayDetailViewController.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class ForecastForDayViewController: ForecastViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = time.flatMap({
            _DateFormatters.forDay.string(from: Date(timeIntervalSince1970:$0))
        })
    }
    
    override func registerCells() {
        forecastCollectionView?.registerNibCell(ForecastDayDetailCollectionViewCell.self)
    }

    override func updateDataWith(forecast:ForecastResponse?){
        guard let items = forecast?.hourly?.data else { return }
        
        self.items = items
    }
    
    override func forecastCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func forecastCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < items.count else {
            return UICollectionViewCell()
        }
        
        let cell: ForecastDayDetailCollectionViewCell = collectionView.dequeueReusableNibCell(for: indexPath)
        
        cell.cofigureWith(forecastItem: items[indexPath.item])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
