//
//  Location.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

struct Location: Codable {
  var geonames: [Geonames]
  
  init(geonames: [Geonames]) {
    self.geonames = geonames
  }
  
  enum CodingKeys: String, CodingKey {
    case geonames = "geonames"
  }
}

struct Geonames: Codable {
  var name: String
  var countryCode: String
  
  init(name: String, countryCode: String) {
    self.name = name
    self.countryCode = countryCode
  }
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case countryCode = "countryCode"
  }
}
