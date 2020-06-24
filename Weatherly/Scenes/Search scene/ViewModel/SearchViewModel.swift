//
//  SearchViewModel.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

final class SearchViewModel: NSObject {
  var searchActionHandler: Action?
  var location: Location? {
    didSet {
      searchActionHandler?()
    }
  }
  var city: City? {
    didSet {
      searchActionHandler?()
    }
  }
  private lazy var networkingManager = NetworkingManager()
  
  init(location: Location? = nil) {
    self.location = location
  }
}

extension SearchViewModel {
  func searchLocation(input: String) {
    let userName = "ivanKulundzic"
    let urlToUse = "http://api.geonames.org/searchJSON?q=\(input)&maxRows=10&username=\(userName)"    
    guard let url = URL(string: urlToUse) else { return }
    networkingManager.getApiData(url: url) { [weak self] (location: Location) in
      self?.location = location
    }
  }
  
  func getCityWeatherData(long: String, lat: String) {
    let longitude = long
    let latitude = lat
    let key = "4b208159f61d43a3a3505ce608eb359d"
    let urlToUse = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)"
    if let url = URL(string: urlToUse) {
      networkingManager.getApiData(url: url) { [weak self] (city: City) in
        self?.city = city
        self?.geoReverse(long: long, lat: lat)
      }
    }
  }
  
  func geoReverse(long: String, lat: String) {
    let longitude = long
    let latitude = lat
    let urlToUse = "http://api.geonames.org/findNearbyPlaceNameJSON?lat=\(latitude)&lng=\(longitude)&username=ivanKulundzic"
    if let url = URL(string: urlToUse) {
      networkingManager.getApiData(url: url) { [weak self] (geoName: CityName) in
        self?.city?.name = geoName.geoname[0].name
      }
    }
  }
}
