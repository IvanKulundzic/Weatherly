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
  private lazy var blurView = UIVisualEffectView()
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//  }
  
  override func loadView() {
    view = searchView
    setupBlurView()
  }
}

private extension SearchViewController {
  func setupBlurView() {
    view.insertSubview(blurView, at: 0)
    let blurViewConstraints = [
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: blurViewConstraints)
    
    blurView.effect = UIBlurEffect(style: .light)
  }
}
