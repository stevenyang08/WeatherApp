//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Wellison Pereira on 3/30/19.
//  Copyright © 2019 Wellison Pereira. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!

    //Variables
    var forecast: [ForecastDay] = []
    var isFetchingData: Bool = false
    private let manager = CLLocationManager()
    private var queryZipCode = "" {
        didSet {
            loadWeatherData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "weatherDetailsSegue", let forecast = sender as? ForecastDay, let destination = segue.destination as? ForecastDetailsViewController else { return }
        destination.forecast = forecast
        Log.logger.info("Passing forecasta data to next view.")
    }
    
    //Storyboard Actions
    @IBAction private func reloadWeatherButtonPressed(_ sender: UIBarButtonItem) {
        guard isValidZipCode(zipCode: queryZipCode), !isFetchingData else { return }
        
        isFetchingData = true
        loadWeatherData()
    }
    
    @IBAction private func searchByLocationButtonPressed(_ sender: UIBarButtonItem) {
        if isFetchingData {
            return
        }
        
        isFetchingData = true
        LocationService.shared.getLocationStatus { [weak self] (shouldRequest, enabled) in
            guard !shouldRequest else {
                self?.manager.requestWhenInUseAuthorization()
                self?.isFetchingData = false
                Log.logger.info("Requesting location permission from user.")
                return
            }
            
            if enabled {
                self?.searchByLocation()
                Log.logger.info("Searching by location.")
            }
        }
    }
    
    @IBAction private func presentSearchButtonPressed(_ sender: UIBarButtonItem) {
        if isFetchingData {
            return
        }
        
        isFetchingData = true
        presentSearch()
        Log.logger.info("Presenting search box")
    }
    
    //Functions
    private func setupView() {
        manager.delegate = self
        view.addGradient(topColor: #colorLiteral(red: 0.7450980392, green: 0.5490196078, blue: 0.7137254902, alpha: 1), bottomColor: #colorLiteral(red: 0.3607843137, green: 0.3607843137, blue: 0.5529411765, alpha: 1))
        Log.logger.info("Setup View was called, delegate was set and background color was set.")
    }
    
    
    /// Makes an API call to get the weather.
    private func loadWeatherData() {
        WeatherService.getWeather(query: queryZipCode) { [weak self] (weather) in
            if let weather = weather {
                self?.updateViewWithWeather(weather: weather)
            } else {
                ErrorBanner.displayErrorBanner(with: .genericError)
                self?.isFetchingData = false
                self?.hideLoading()
                Log.logger.info("Failed to fetch data.")
            }
        }
    }
    
    
    /// Updates the view's weatherCollectionView with new data.
    ///
    /// - Parameter weather: The weather object returned from the API call.
    private func updateViewWithWeather(weather: Weather) {
        forecast = weather.forecast.forecastDay
        weatherCollectionView.reloadData()
        isFetchingData = false
        hideLoading()
        
        emptyView.isHidden = forecast.count > 0
        title = weather.location.name
        Log.logger.info("View was updated with new information.")
    }
    
    
    /// Searches the user's current location for weather data.
    private func searchByLocation() {
        showLoading()
        manager.startUpdatingLocation()
    }
    
    
    /// Creates a UIAlertController with a text field to input the user's data.
    private func presentSearch() {
        let alert = UIAlertController(title: "Search By Zip Code", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (_) in
            self.isFetchingData = false
        })
        let searchAction = UIAlertAction(title: "Search", style: .default, handler: { [weak alert] (_) in
            guard let text = alert?.textFields?.first?.text else { return }
            self.queryZipCode = text
            Log.logger.info("Search query initiated from submit button.")
        })
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Zip Code"
        }
        
        alert.addAction(cancelAction)
        alert.addAction(searchAction)
        self.present(alert, animated: true, completion: nil)
        Log.logger.info("Search Alert Controller was displayed.")
    }

}


// MARK: - Extension with helper functions.
extension ForecastViewController {
    private func isValidZipCode(zipCode: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?!0{3})[0-9]{3,5}$")
        return regex.matches(in: zipCode, range: NSRange(location: 0, length: zipCode.count)).first != nil
    }
}


// MARK: - Extension for CLLocationManager.
extension ForecastViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Log.logger.info("CLLocation didUpdateLocations called, location data: \(locations)")
        guard let currentLocation = locations.first else {
            isFetchingData = false
            hideLoading()
            return
        }
        
        CLGeocoder().reverseGeocodeLocation(currentLocation) { [weak self] (placemarks, error) in
            guard error == nil, let zipCode = placemarks?.first?.postalCode else {
                Log.logger.error("Failed to reverse Geocode Location with error.")
                ErrorBanner.displayErrorBanner(with: .genericError)
                self?.isFetchingData = false
                self?.hideLoading()
                return
            }
            
            self?.queryZipCode = zipCode
            Log.logger.info("CLLocation zip code was updated.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Log.logger.error("Location Manager failed to update location: \(error)")
        isFetchingData = false
        hideLoading()
    }
}


// MARK: - UICollectionViewDelegate
extension ForecastViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log.logger.info("Selected indexPath: \(indexPath)")
        performSegue(withIdentifier: "weatherDetailsSegue", sender: forecast[indexPath.item])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
}


// MARK: - UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UICollectionViewCell() }
        
        cell.set(forecast: forecast[indexPath.item])
        
        return cell
    }
}
