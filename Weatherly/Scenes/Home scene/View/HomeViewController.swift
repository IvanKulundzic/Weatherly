//
//  ViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 02/04/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  private(set) lazy var homeViewModel = HomeViewModel()
  private lazy var homeView = HomeView()
  
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

// MARK: - conform to searchViewControllerDelegate
extension HomeViewController: SearchViewControllerDelegate {
  var city: City? {
    get {
      return self.city
    }
    set {
      homeViewModel.city = newValue
    }
  }
}

// MARK: - conform to SettingsViewControllerDelegate
extension HomeViewController: SettingsViewControllerDelegate {
  
  
 
  
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
      self?.present(vc, animated: true)
    }
  }
}
