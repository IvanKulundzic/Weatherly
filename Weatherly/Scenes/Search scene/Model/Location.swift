//
//  Location.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

struct Location: Codable {
  var totalResultsCount: Int
  var geonames: [Geonames]
  
  init(totalResultsCount: Int, geonames: [Geonames]) {
    self.totalResultsCount = totalResultsCount
    self.geonames = geonames
  }
}

struct Geonames: Codable {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}
