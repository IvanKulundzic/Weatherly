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
//  private lazy var visualView = UIVisualEffectView()
  
  override func loadView() {
    view = settingsView
    let blurEffect = UIBlurEffect(style: .light)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    view.insertSubview(blurView, at: 0)
    
    NSLayoutConstraint.activate([
    blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
    blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
    
//    UIView.animate(withDuration: 5) { [weak self] in
//      self?.visualView.effect = UIBlurEffect(style: .dark)
//    }
  }
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//  }
  
//  
}
