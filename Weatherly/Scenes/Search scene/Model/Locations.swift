//
//  Location.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import RealmSwift

struct Locations: Codable {
  var geonames: [Geonames]
  
  init(geonames: [Geonames]) {
    self.geonames = geonames
  }
  
  enum CodingKeys: String, CodingKey {
    case geonames = "geonames"
  }
}

@objcMembers class Geonames: Object, Codable {
   dynamic var name: String = ""
   dynamic var countryCode: String = ""
   dynamic var longitude: String = ""
   dynamic var latitude: String = ""
  
  convenience init(name: String, countryCode: String, longitude: String, latitude: String) {
    self.init()
    self.name = name
    self.countryCode = countryCode
    self.longitude = longitude
    self.latitude = latitude
  }
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case countryCode = "countryCode"
    case longitude = "lng"
    case latitude = "lat"
  }
}

//struct Geonames: Codable {
//   var name: String
//   var countryCode: String
//   var longitude: String
//   var latitude: String
//
//  init(name: String, countryCode: String, longitude: String, latitude: String) {
//    self.name = name
//    self.countryCode = countryCode
//    self.longitude = longitude
//    self.latitude = latitude
//  }
//
//  enum CodingKeys: String, CodingKey {
//    case name = "name"
//    case countryCode = "countryCode"
//    case longitude = "lng"
//    case latitude = "lat"
//  }
//}


//struct Location: Codable {
//  var geonames: [Geonames]
//
//  init(geonames: [Geonames]) {
//    self.geonames = geonames
//  }
//
//  enum CodingKeys: String, CodingKey {
//    case geonames = "geonames"
//  }
//}
//
//struct Geonames: Codable {
//  var name: String
//  var countryCode: String
//  var longitude: String
//  var latitude: String
//
//  init(name: String, countryCode: String, longitude: String, latitude: String) {
//    self.name = name
//    self.countryCode = countryCode
//    self.longitude = longitude
//    self.latitude = latitude
//  }
//
//  enum CodingKeys: String, CodingKey {
//    case name = "name"
//    case countryCode = "countryCode"
//    case longitude = "lng"
//    case latitude = "lat"
//  }
//}
