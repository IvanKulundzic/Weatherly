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
  
  init(location: Location? = nil) {
    self.location = location
  }
}
