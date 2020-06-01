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
  var city: City? {
    didSet {
      cityChangedHandler?()
    }
  }
  private let coreLocationManager = CLLocationManager()
  private let networkingManager = NetworkingManager()
  private let dateFormatter = DateFormatter()
  
  init(city: City? = nil) {
    self.city = city    
  }
}

extension HomeViewModel {
  var time: Int {
    return city?.currentWeather.time ?? 0
  }
  
  var cityName: String? {
    return city?.name
  }
  
  var cityTemperature: String? {
    return "\(String(describing: round(((city?.currentWeather.temperature ?? 0.0) - 32) / 2))) ℃"
  }
  
  var cityCondition: String? {
    return city?.currentWeather.summary
  }
  
  var cityWindSpeed: String? {
    return "\(city?.currentWeather.windSpeed ?? 0.0) km/h"
  }
  
  var cityHumidity: String? {
    return "\(city?.currentWeather.humidity ?? 0.0)%"
  }
  
  var cityPressure: String? {
    return "\(city?.currentWeather.pressure ?? 0.0) hpa"
  }
  
  var cityMinTemp: String? {
    let currentTimeTimestamp: TimeInterval = Double(time)
    let currentDate = Date(timeIntervalSince1970: currentTimeTimestamp)
    
    let dailyArray = city?.dailyWeather.data
    
    guard let matchingArrayElement = dailyArray?.first(where: {
      let dailyTime: TimeInterval = Double($0.time)
      let dailyDate = Date(timeIntervalSince1970: dailyTime)
      return Calendar.current.isDate(currentDate, inSameDayAs: dailyDate)
    }) else { return nil }
    return "\(matchingArrayElement.temperatureMin)°"
  }
  
  var cityMaxTemp: String? {
    let currentTimeTimestamp: TimeInterval = Double(time)
    let currentDate = Date(timeIntervalSince1970: currentTimeTimestamp)
    
    let dailyArray = city?.dailyWeather.data
    
    guard let matchingArrayElement = dailyArray?.first(where: {
      let dailyTime: TimeInterval = Double($0.time)
      let dailyDate = Date(timeIntervalSince1970: dailyTime)
      return Calendar.current.isDate(currentDate, inSameDayAs: dailyDate)
    }) else { return nil }
    return "\(matchingArrayElement.temperatureMax)°"
  }
  
  var cityBodyImage: UIImage? {
    guard let cityBodyImageString = city?.currentWeather.icon.rawValue else { return nil }
    return UIImage(named: "body_image-\(cityBodyImageString)")
  }
  
  var cityHeaderImage: UIImage? {
    guard let cityHeaderImageString = city?.currentWeather.icon.rawValue else { return nil }
    return UIImage(named: "header_image-\(cityHeaderImageString)")
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
