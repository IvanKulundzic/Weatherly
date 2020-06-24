//
//  Geoname.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 17/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import RealmSwift

struct CityName: Codable {
  var geoname: [Geoname]

  init(geoname: [Geoname]) {
    self.geoname = geoname
  }
  
  enum CodingKeys: String, CodingKey {
    case geoname = "geonames"
  }
}

@objcMembers class Geoname: Object, Codable {
  dynamic var name: String = ""

  convenience init(name: String) {
    self.init()
    self.name = name
  }
  
//  required init() {
//    fatalError("init() has not been implemented")
//  }
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
  }
}
