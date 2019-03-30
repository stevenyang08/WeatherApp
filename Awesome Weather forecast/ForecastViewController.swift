//
//  ViewController.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import UIKit

class ForecastViewController: CollectionViewController {
    typealias ForecastLocation = (latitude: Double, longitude: Double)
    private let networkManager: NetworkRequestManager = NetworkManagerV1()
    
    var items = [ForecastItem]() {
        didSet{
            forecastCollectionView?.collectionViewLayout.invalidateLayout()
            forecastCollectionView?.reloadData()
        }
    }
    
    var location: ForecastLocation!
    var time: TimeInterval?
    var requestModel: ForecastRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func updateDataWith(forecast:ForecastResponse?){
        guard let items = forecast?.daily?.data else { return }
        
        self.items = items
    }
    
    override func registerCells(){
        forecastCollectionView?.registerNibCell(ForecastCollectionViewCell.self)
    }
    
    override func forecastCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func forecastCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < items.count else {
            return UICollectionViewCell()
        }
        
        let cell: ForecastCollectionViewCell = collectionView.dequeueReusableNibCell(for: indexPath)
        
        cell.cofigureWith(forecastItem: items[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        guard indexPath.item < items.count else { return }
        
        guard let time = items[indexPath.item].time else { return }
        
        Router().openDayForecast(for: location, time: time.timeIntervalSince1970)
    }
    
    private func loadData() {
        networkManager.getForecast(latitude: location.latitude,
                                   longitude: location.longitude,
                                   time: time,
                                   params: requestModel.dictionary) { [weak self] (response) in
            self?.updateDataWith(forecast: response)
        }
    }
}
