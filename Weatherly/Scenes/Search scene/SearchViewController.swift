//
//  SearchViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 29/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
  private lazy var searchView = SearchView()
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//  }
  
  override func loadView() {
    view = searchView
    print("loadView")
  }
}
