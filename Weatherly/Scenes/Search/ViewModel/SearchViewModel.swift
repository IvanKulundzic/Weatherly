//
//  SearchViewModel.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import RealmSwift

final class SearchViewModel {
  var searchActionHandler: Action?
  var locations: Locations? {
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
  
  init(location: Locations? = nil) {
    self.locations = location
  }
}

// MARK: - get weather data
extension SearchViewModel {
  /// do an API call to get locations by name
  func getLocationsByName(input: String) {
    let userName = "ivanKulundzic"
    let urlToUse = "http://api.geonames.org/searchJSON?q=\(input)&maxRows=10&username=\(userName)"    
    guard let url = URL(string: urlToUse) else { return }
    networkingManager.getApiData(url: url) { [weak self] (locations: Locations) in
      self?.locations = locations
    }
  }
  /// get city weather data
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
  /// use geoReversing to grab city name when doing a search
  func geoReverse(long: String, lat: String) {
    let longitude = long
    let latitude = lat
    let urlToUse = "http://api.geonames.org/findNearbyPlaceNameJSON?lat=\(latitude)&lng=\(longitude)&username=ivanKulundzic"
    if let url = URL(string: urlToUse) {
      networkingManager.getApiData(url: url) { [weak self] (geoName: Locations) in
        self?.city?.name = geoName.geonames[0].name
        let realm = try! Realm()
        let object = Geonames(name: geoName.geonames[0].name, countryCode: geoName.geonames[0].countryCode, longitude: geoName.geonames[0].longitude, latitude: geoName.geonames[0].latitude)
        let realmArray = realm.objects(Geonames.self)
        if realmArray.first(where: { object.name == $0.name }) != nil {
          return
        } else {
          do {
            try realm.write {
              realm.add(object)
            }
          } catch {
            print(error)
          }
        }
      }
    }
  }
}
