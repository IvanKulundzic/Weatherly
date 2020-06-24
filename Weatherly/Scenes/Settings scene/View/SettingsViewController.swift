//
//  SettingsViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 27/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit
import RealmSwift

final class SettingsViewController: UIViewController {
  private lazy var settingsView = SettingsView()
  private lazy var blurView = UIVisualEffectView()
  
  let cellId = "settingsCell"
  let realm = try! Realm()
  
  
  override func loadView() {
    view = settingsView
    settingsView.locationsListTableView.dataSource = self
    settingsView.locationsListTableView.delegate = self
    
    
//    let realm = try! Realm()
//    let array = realm.objects(RealmModel.self)
//    print(Realm.Configuration.defaultConfiguration.fileURL!)
//    checkIfDatabaseExists()
    
    settingsViewDoneButtonTapped()
    addBlurEffect()
  }
}

extension SettingsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsTableViewCell
//    let realm = try! Realm()
    let array = realm.objects(RealmModel.self)
    cell.locationNameLabel.text = array[indexPath.row].name
    cell.removeButtonActionHandler = {
      print("We're here, yay!")
      try! self.realm.write {
        self.realm.delete(array[indexPath.row])
      }
      
      tableView.reloadData()
    }
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    let realm = try! Realm()
    let array = realm.objects(RealmModel.self)
    return array.count
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    
    
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
