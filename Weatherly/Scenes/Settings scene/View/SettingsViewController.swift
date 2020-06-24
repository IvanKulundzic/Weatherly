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
  private lazy var blurView = UIVisualEffectView()
  
  let cellId = "settingsCell"
  
  override func loadView() {
    view = settingsView
    settingsView.locationsListTableView.dataSource = self    
    
    settingsViewDoneButtonTapped()
    addBlurEffect()
  }
}

extension SettingsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsTableViewCell
    let array = ["London", "Osijek", "Zagreb", "Rio"]
    cell.locationNameLabel.text = array[indexPath.row]
    return cell  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  
}

// MARK: - settings button tapped
private extension SettingsViewController {
  func settingsViewDoneButtonTapped() {
    settingsView.doneButtonActionHandler = { [weak self] in
      self?.dismiss(animated: true, completion: nil)
    }
  }
}

// MARK: - blur effect
private extension SettingsViewController {
  func addBlurEffect() {
    view.insertSubview(blurView, at: 0)
    let blurViewConstraints = [
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: blurViewConstraints)
    
    blurView.effect = UIBlurEffect(style: .light)
  }
}
