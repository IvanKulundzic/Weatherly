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
  private lazy var networkingManager = NetworkingManager()
  
  init(location: Location? = nil) {
    self.location = location
  }
}

//extension SearchViewModel {
//  var textArray: String? {
//    return location?.geonames[0].name
//  }
//}

extension SearchViewModel {
  func searchLocation(input: String) {
    let input = input
    let userName = "ivanKulundzic"
    let urlToUse = "http://api.geonames.org/searchJSON?q=\(input)&maxRows=10&username=\(userName)"
    print(urlToUse)
    guard let url = URL(string: urlToUse) else { return }
    networkingManager.getApiData(url: url) { [weak self] (location: Location) in
      self?.location = location
      //self?.searchActionHandler?()
    }
  }
}
