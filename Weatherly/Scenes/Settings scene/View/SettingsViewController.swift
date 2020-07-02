//
//  SettingsViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 27/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit
import RealmSwift

protocol SettingsViewControllerDelegate: class {
  var city: City? { get set }
  func getSettings(hideHumidity: Bool, hideWind: Bool, hidePressure: Bool)
}

final class SettingsViewController: UIViewController {
  var delegate: SettingsViewControllerDelegate?
  var locations: [Geonames]?
  private let settingsViewModel = SettingsViewModel()
  private(set) lazy var settingsView = SettingsView()
  private lazy var blurView = UIVisualEffectView()
  let cellId = "settingsCell"
  let realm = try! Realm()
  let searchVM = SearchViewModel()
  
  var hideHumidity: Bool {
    get { settingsView.hideHumidity ?? false }
    set { settingsView.hideHumidity = newValue}
  }
  
  var hideWind: Bool {
    get { settingsView.hideWind ?? false }
    set { settingsView.hideHumidity = newValue }
  }
  
  var hidePressure: Bool {
    get { settingsView.hidePressure ?? false }
    set { settingsView.hidePressure = newValue }
  }
  
  override func loadView() {
    view = settingsView
  }
  
  override func viewDidLoad() {
    settingsView.locationsListTableView.dataSource = self
    settingsView.locationsListTableView.delegate = self
    settingsViewDoneButtonTapped()
    addBlurEffect()
  }
}

extension SettingsViewController: HomeViewControllerDelegate {
  func getSettingsData(hideHumidity: Bool, hideWind: Bool, hidePressure: Bool) {
    settingsView.hideHumidity = hideHumidity
    settingsView.hideWind = hideWind
    settingsView.hidePressure = hidePressure
  }
}

extension SettingsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsTableViewCell
    let array = realm.objects(Geonames.self)    
    cell.locationNameLabel.text = array[indexPath.row].name
    cell.removeButtonActionHandler = {
      try! self.realm.write {
        self.realm.delete(array[indexPath.row])
      }
      tableView.reloadData()
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let array = realm.objects(Geonames.self)
    return array.count
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let array = realm.objects(Geonames.self)
    let selectedCellLongitude = array[indexPath.row].longitude
    let selectedCellLatitude = array[indexPath.row].latitude
    settingsViewModel.getCityWeatherData(long: selectedCellLongitude, lat: selectedCellLatitude)
    settingsViewModel.geoReverse(long: selectedCellLongitude, lat: selectedCellLatitude)
    settingsViewModel.settingsActionHandler = { [weak self] in
//      self?.delegate?.city = self?.settingsViewModel.city
      self?.settingsView.city = self?.settingsViewModel.city
//      self?.dismiss(animated: true, completion: nil)
    }
//    print("SVM", settingsViewModel.city)
//    settingsView.city = settingsViewModel.city
  }
}

// MARK: - settings button tapped
private extension SettingsViewController {
  func settingsViewDoneButtonTapped() {
    settingsView.doneButtonActionHandler = { [weak self] in
      self?.hideHumidity = self?.settingsView.hideHumidity ?? false
      self?.delegate?.getSettings(hideHumidity: self?.hideHumidity ?? false, hideWind: self?.hideWind ?? false, hidePressure: self?.hidePressure ?? false)
      self?.delegate?.city = self?.settingsView.city
//      print("SV city", self?.settingsView.city)
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
