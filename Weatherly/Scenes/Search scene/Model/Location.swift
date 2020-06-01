//
//  Location.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 01/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

struct Location: Codable {
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
}
