//
//  SettingsModel.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 30/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

struct SettingsModel {
  let location: Geonames
  let units: String
  let hideHumidity: Bool
  let hideWind: Bool
  let hidePressure: Bool
  
  init(location: Geonames, units: String, hideHumidity: Bool, hideWind: Bool, hidePressure: Bool) {
    self.location = location
    self.units = units
    self.hideHumidity = hideHumidity
    self.hideWind = hideWind
    self.hidePressure = hidePressure
  }
}
