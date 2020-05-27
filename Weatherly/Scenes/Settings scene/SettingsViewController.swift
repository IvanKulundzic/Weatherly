//
//  SettingsViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 27/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
  private lazy var settingsView = SettingsView()
  
  override func loadView() {
    view = settingsView
  }
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//  }
  
//  
}
