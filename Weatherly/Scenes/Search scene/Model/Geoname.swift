//
//  Geoname.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 17/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

public struct CityName: Codable {
  public var geoname: [Geoname]
  
  init(geoname: [Geoname]) {
    self.geoname = geoname
  }
  
  enum CodingKeys: String, CodingKey {
    case geoname = "geonames"
  }
}

public struct Geoname: Codable {
  public var name: String
  
  init(name: String) {
    self.name = name
  }
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
  }
}
