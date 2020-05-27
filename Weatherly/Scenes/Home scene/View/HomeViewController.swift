//
//  ViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 02/04/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  private lazy var homeView = HomeView()
  
  override func loadView() {
    view = homeView
    homeViewSettingsButtonTapped()
  }
  
  func homeViewSettingsButtonTapped () {
    homeView.settingsButtonActionHandler = { [weak self] in
      let vc = SettingsViewController()
      self?.present(vc, animated: true, completion: nil)
    }
  }
}
