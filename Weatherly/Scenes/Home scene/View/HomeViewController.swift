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
  private lazy var homeViewModel = HomeViewModel()
  
  override func loadView() {
    view = homeView
    homeViewSettingsButtonTapped()
    homeViewSearchBarTapped()
    homeViewModel.getCurrentLocation()
    viewModelHandler()
  }
  
  func updateUI() {
    homeView.cityName = homeViewModel.cityName
    homeView.temperature = homeViewModel.cityTemperature
    homeView.summary = homeViewModel.cityCondition
    homeView.humidity = homeViewModel.cityHumidity
    homeView.wind = homeViewModel.cityWindSpeed
    homeView.pressure = homeViewModel.cityPressure
    homeView.lowTemperatureValue = homeViewModel.cityMinTemp
    homeView.highTemperatureValue = homeViewModel.cityMaxTemp
  }
  
  func viewModelHandler() {
    homeViewModel.cityChangedHandler = { [weak self] in
      self?.updateUI()
      
    }
  }
  
  func homeViewSettingsButtonTapped () {
    homeView.settingsButtonActionHandler = { [weak self] in
      let vc = SettingsViewController()
      self?.present(vc, animated: true, completion: nil)
    }
  }
  
  func homeViewSearchBarTapped() {
    homeView.searchBarActionHandler = { [weak self] in
      let vc = SearchViewController()
      self?.present(vc, animated: true, completion: nil)
    }
  }
}

