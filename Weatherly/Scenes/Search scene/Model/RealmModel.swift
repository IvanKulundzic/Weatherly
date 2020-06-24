//
//  RealmModel.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 24/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RealmModel: Object {
  dynamic var name: String = ""
  
  convenience init(name: String) {
    self.init()
    self.name = name
  }
  
}
