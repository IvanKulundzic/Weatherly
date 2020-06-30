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
  private(set) lazy var homeViewModel = HomeViewModel()
  private lazy var homeView = HomeView()
  
  var delegate: HomeViewControllerDelegate?
  
  override func loadView() {
    view = homeView
    homeView.activityIndicatorView.startAnimating()
  }
  
  override func viewDidLoad() {
    homeViewSettingsButtonTapped()
    homeViewSearchBarTapped()
    homeViewModel.getCurrentLocation()
    viewModelHandler()
  }
}

// MARK: - conform to searchViewControllerDelegate and settingsVCDelegate
extension HomeViewController: SearchViewControllerDelegate, SettingsViewControllerDelegate {
  
  
  func getData(hideHumidity: Bool, hideWind: Bool, hidePressure: Bool) {
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
      let vc = SearchViewController()
      vc.delegate = self
      self?.present(vc, animated: true)
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
