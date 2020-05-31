//
//  HomeViewModel.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 31/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

final class HomeViewModel: NSObject {
  var cityChangedHandler: Action?
  private var city: City? {
    didSet {
      cityChangedHandler?()
    }
  }
  private let coreLocationManager = CLLocationManager()
  private let networkingManager = NetworkingManager()
  
  init(city: City? = nil) {
    self.city = city
  }
}

extension HomeViewModel {
  func getCurrentLocation() {
    coreLocationManager.delegate = self
    coreLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    coreLocationManager.requestWhenInUseAuthorization()
    coreLocationManager.startUpdatingLocation()
  }
}

extension HomeViewModel: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    // When horizontal accuracy is over 0, a location has been found so the location manager can stop updating
    if location.horizontalAccuracy > 0 {
      coreLocationManager.stopUpdatingLocation()
      fetchCity(location: location)
    }
  }
}

private extension HomeViewModel {
  func fetchCity(location: CLLocation) {
    let latitude = String(location.coordinate.latitude)
    let longitude = String(location.coordinate.longitude)
    
    let key = "4b208159f61d43a3a3505ce608eb359d"
    let urlToUse = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)"
    
    guard let url = URL(string: urlToUse) else { return }
    networkingManager.getApiData(url: url) { [weak self] (city: City) in
      self?.city = city
      self?.cityChangedHandler?()
    }
  }
}
