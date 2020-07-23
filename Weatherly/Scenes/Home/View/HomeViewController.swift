//
//  ViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 02/04/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
  func getSettingsData(hideHumidity: Bool, hideWind: Bool, hidePressure: Bool)
}

final class HomeViewController: UIViewController {
  var delegate: HomeViewControllerDelegate?
  private(set) lazy var homeViewModel = HomeViewModel()
  private lazy var homeView = HomeView()
  
  override func loadView() {
    view = homeView
  }
  
  override func viewDidLoad() {
    homeView.activityIndicatorView.startAnimating()
    checkUnits()
    homeViewSettingsButtonTapped()
    homeViewSearchBarTapped()
    homeViewModel.getCurrentLocation()
    viewModelHandler()
      
    }
}

// MARK: - conform to searchViewControllerDelegate and settingsVCDelegate
extension HomeViewController: SearchViewControllerDelegate, SettingsViewControllerDelegate {
  func getSettings(hideHumidity: Bool, hideWind: Bool, hidePressure: Bool) {
    homeView.hideHumidity = hideHumidity
    homeView.hideWind = hideWind
    homeView.hidePressure = hidePressure
  }
  
  var city: City? {
    get {
      homeViewModel.city
    }
    set {
      homeViewModel.city = newValue
    }
  }
}

// MARK: - check if there is a value for units
private extension HomeViewController {
  func checkUnits() {
    let defaults = UserDefaults.standard
    if defaults.object(forKey: "units") as? String == "" && defaults.object(forKey: "units") == nil {
      defaults.set("si", forKey: "units")
    } else {
      print("Got a default units set: \(defaults.object(forKey: "units") ?? "No value set for units")")
    }
  }
}

// MARK: - update UI with model data
private extension HomeViewController {
  func updateUI() {
    homeView.cityName = homeViewModel.cityName
    homeView.temperature = homeViewModel.cityTemperature
    homeView.summary = homeViewModel.cityCondition
    homeView.humidity = homeViewModel.cityHumidity
    homeView.wind = homeViewModel.cityWindSpeed
    homeView.pressure = homeViewModel.cityPressure
    homeView.lowTemperatureValue = homeViewModel.cityMinTemp
    homeView.highTemperatureValue = homeViewModel.cityMaxTemp
    homeView.bodyImage = homeViewModel.cityBodyImage
    homeView.headerImage = homeViewModel.cityHeaderImage
    homeView.gradient = homeViewModel.gradient
    homeView.activityIndicatorView.stopAnimating()
  }
  
  func viewModelHandler() {
    homeViewModel.cityChangedHandler = { [weak self] in
      self?.updateUI()
    }
  }
}

// MARK: - buttons tapped
private extension HomeViewController {
  func homeViewSearchBarTapped() {
    homeView.textFieldActionHandler = { [weak self] in
      DispatchQueue.main.async {
        let vc = SearchViewController()
        vc.delegate = self
        self?.present(vc, animated: true)
      }
      
    }
  }
  
  func homeViewSettingsButtonTapped () {
    homeView.settingsButtonActionHandler = { [weak self] in
      let vc = SettingsViewController()
      vc.delegate = self
      vc.getSettingsData(hideHumidity: self?.homeView.hideHumidity ?? false, hideWind: self?.homeView.hideWind ?? false , hidePressure: self?.homeView.hidePressure ?? false)
      self?.present(vc, animated: true)
    }
  }
}
