//
//  HomeView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 12/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

final class HomeView: UIView, UISearchBarDelegate {
  var settingsButtonActionHandler: Action?
  var searchBarActionHandler: Action?
  private lazy var headerImageView = UIImageView()
  private lazy var bodyImageView = UIImageView()
  private lazy var cityNameLabel = UILabel()
  private lazy var temperatureLabel = UILabel()
  private lazy var summaryLabel = UILabel()
  private lazy var leftStackView = UIStackView()
  private lazy var rightStackView = UIStackView()
  private lazy var separatorView = UIView()
  private lazy var lowTemperature = UILabel()
  private lazy var lowTemperatureLabel = UILabel()
  private lazy var highTemperature = UILabel()
  private lazy var highTemperatureLabel = UILabel()
  private lazy var bottomStackView = UIStackView()
  private lazy var bottomLeftStackView = UIStackView()
  private lazy var bottomMiddleStackView = UIStackView()
  private lazy var bottomRightStackView = UIStackView()
  private lazy var humidityIcon = UIImageView()
  private lazy var humidityLabel = UILabel()
  private lazy var windIcon = UIImageView()
  private lazy var windLabel = UILabel()
  private lazy var pressureIcon = UIImageView()
  private lazy var pressureLabel = UILabel()
  private lazy var settingsButton = UIButton()
  private lazy var searchBar = UISearchBar()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  @objc func textFieldTapped() {
    print("Tap")
    //searchBarActionHandler?()
    
  }
  
}

// MARK: - view properties
extension HomeView {
  var headerImage: UIImage? {
    get { headerImageView.image }
    set { headerImageView.image = newValue }
  }
  
  var bodyImage: UIImage? {
    get { bodyImageView.image }
    set { bodyImageView.image = newValue }
  }
  
  var cityName: String? {
    get { cityNameLabel.text }
    set { cityNameLabel.text = newValue }
  }
  
  var temperature: String? {
    get { temperatureLabel.text }
    set { temperatureLabel.text = newValue }
  }
  
  var summary: String? {
    get { summaryLabel.text }
    set { summaryLabel.text = newValue }
  }
  
  var lowTemperatureValue: String? {
    get { lowTemperature.text }
    set { lowTemperature.text = newValue }
  }
  
  var highTemperatureValue: String? {
    get { highTemperature.text }
    set { highTemperature.text = newValue }
  }
  
  var humidity: String? {
    get { humidityLabel.text }
    set { humidityLabel.text = newValue }
  }
  
  var wind: String? {
    get { windLabel.text }
    set { windLabel.text = newValue }
  }
  
  var pressure: String? {
    get { pressureLabel.text }
    set { pressureLabel.text = newValue }
  }
}

// MARK: - searchBar tapped
extension HomeView {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    print("Tap")
    searchBarActionHandler?()
  }
}

// MARK: - settingsButton tapped
private extension HomeView {
  @objc func settingButtonTapped() {
    settingsButtonActionHandler?()
  }
}

// MARK: - view setup
private extension HomeView {
  func setupView() {
    searchBar.delegate = self
    
    setupHeaderImageView()
    setupBodyImageView()
    setupCityNameLabel()
    setupTemperatureLabel()
    setupSummaryLabel()
    setupLeftStackView()
    setupRightStackView()
    setupSeparatorView()
    setupLowTemperature()
    setupLowTemperatureLabel()
    setupHighTemperature()
    setupHighTemperatureLabel()
    setupSettingsButton()
    setupSearchBar()
    setupBottomStackView()
    setupBottomLeftStackView()
    setupBottomMiddleStackView()
    setupBottomRightStackView()
    setupHumidityIcon()
    setupHumidityLabel()
    setupWindIcon()
    setupWindLabel()
    setupPressureIcon()
    setupPressureLabel()
  }
  
  func setupHeaderImageView() {
    addSubview(headerImageView)
    let headerImageViewConstraints = [
      headerImageView.topAnchor.constraint(equalTo: topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      headerImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4, constant: 1)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: headerImageViewConstraints)
    
    headerImageView.image = UIImage(named: "header_image-clear-day")
    headerImageView.contentMode = .scaleAspectFit
  }
  
  func setupBodyImageView() {
    addSubview(bodyImageView)
    let bodyImageViewConstraints = [
      bodyImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
      bodyImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      bodyImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      bodyImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 50)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bodyImageViewConstraints)
    
    bodyImageView.image = UIImage(named: "body_image-clear-day")
  }
  
  func setupCityNameLabel() {
    addSubview(cityNameLabel)
    let cityNameLabelConstraints = [
      cityNameLabel.topAnchor.constraint(equalTo: bodyImageView.topAnchor, constant: 40),
      cityNameLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      cityNameLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: cityNameLabelConstraints)
    
//    cityNameLabel.text = "London"
    cityNameLabel.textColor = .white
    cityNameLabel.textAlignment = .center
    cityNameLabel.font = UIFont.systemFont(ofSize: 50)
  }
  
  func setupTemperatureLabel() {
    addSubview(temperatureLabel)
    let temperatureLabelConstraints = [
      temperatureLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -50),
      temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
      temperatureLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      temperatureLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: temperatureLabelConstraints)
    
    temperatureLabel.text = "20°"
    temperatureLabel.textColor = .white
    temperatureLabel.textAlignment = .center
    temperatureLabel.font = UIFont(name: "Gotham Rounded - Light", size: 72)
  }
  
  func setupSummaryLabel() {
    addSubview(summaryLabel)
    let summaryLabelConstraints = [
      summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -10),
      summaryLabel.heightAnchor.constraint(equalToConstant: 50),
      summaryLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      summaryLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: summaryLabelConstraints)
    
    summaryLabel.text = "Sunny"
    summaryLabel.textColor = .white
    summaryLabel.textAlignment = .center
    summaryLabel.font = UIFont.systemFont(ofSize: 20)
  }
  
  func setupLeftStackView() {
    addSubview(leftStackView)
    let leftStackViewConstraints = [
      leftStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      leftStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
      leftStackView.heightAnchor.constraint(equalToConstant: 75),
      leftStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: leftStackViewConstraints)
    
    leftStackView.distribution = .equalSpacing
    leftStackView.axis = .vertical
    leftStackView.alignment = .center
  }
  
  func setupRightStackView() {
    addSubview(rightStackView)
    let rightStackViewConstraints = [
      rightStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      rightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
      rightStackView.heightAnchor.constraint(equalToConstant: 75),
      rightStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: rightStackViewConstraints)
    
    rightStackView.distribution = .equalCentering
    rightStackView.axis = .vertical
    rightStackView.alignment = .center
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    let separatorViewConstraints = [
      separatorView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      separatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      separatorView.widthAnchor.constraint(equalToConstant: 5),
      separatorView.heightAnchor.constraint(equalTo: leftStackView.heightAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: separatorViewConstraints)
    
    separatorView.backgroundColor = .white
  }
  
  func setupLowTemperature() {
    leftStackView.addArrangedSubview(lowTemperature)
    
//    lowTemperature.text = "89.3° F"
    lowTemperature.textAlignment = .center
    lowTemperature.font = UIFont.systemFont(ofSize: 30)
    lowTemperature.textColor = .white
  }
  
  func setupLowTemperatureLabel() {
    leftStackView.addArrangedSubview(lowTemperatureLabel)
    
    lowTemperatureLabel.text = "Low"
    lowTemperatureLabel.textColor = .white
    lowTemperatureLabel.textAlignment = .center
    lowTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
  }
  
  func setupHighTemperature() {
    rightStackView.addArrangedSubview(highTemperature)
    
    highTemperature.text = "95.4° F"
    highTemperature.textColor = .white
    highTemperature.textAlignment = .center
    highTemperature.font = UIFont.systemFont(ofSize: 30)
  }
  
  func setupHighTemperatureLabel() {
    rightStackView.addArrangedSubview(highTemperatureLabel)
    
    highTemperatureLabel.text = "High"
    highTemperatureLabel.textColor = .white
    highTemperatureLabel.textAlignment = .center
    highTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
  }
  
  func setupBottomStackView() {
    addSubview(bottomStackView)
    let bottomStackViewConstraints = [
      bottomStackView.topAnchor.constraint(equalTo: leftStackView.bottomAnchor, constant: 50),
      bottomStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      bottomStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      bottomStackView.heightAnchor.constraint(equalToConstant: 75),
      //bottomStackView.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bottomStackViewConstraints)
    
    bottomStackView.distribution = .fillEqually
    bottomStackView.axis = .horizontal
    bottomStackView.alignment = .center
  }
  
  func setupBottomLeftStackView() {
    bottomStackView.addArrangedSubview(bottomLeftStackView)
    
    bottomLeftStackView.distribution = .equalCentering
    bottomLeftStackView.axis = .vertical
    bottomLeftStackView.alignment = .center
  }
  
  func setupBottomMiddleStackView() {
    bottomStackView.addArrangedSubview(bottomMiddleStackView)
    
    bottomMiddleStackView.axis = .vertical
    bottomMiddleStackView.alignment = .center
    bottomMiddleStackView.distribution = .equalCentering
    
  }
  
  func setupBottomRightStackView() {
    bottomStackView.addArrangedSubview(bottomRightStackView)
    
    bottomRightStackView.distribution = .equalCentering
    bottomRightStackView.axis = .vertical
    bottomRightStackView.alignment = .center
  }
  
  func setupHumidityIcon() {
    bottomLeftStackView.addArrangedSubview(humidityIcon)
    
    humidityIcon.image = UIImage(named: "humidity_icon")
  }
  
  func setupHumidityLabel() {
    bottomLeftStackView.addArrangedSubview(humidityLabel)
    
    humidityLabel.text = "0.8%"
    humidityLabel.textColor = .white
    humidityLabel.font = UIFont.systemFont(ofSize: 25)
  }
  
  func setupWindIcon() {
    bottomMiddleStackView.addArrangedSubview(windIcon)
    
    windIcon.image = UIImage(named: "wind_icon")
  }
  
  func setupWindLabel() {
    bottomMiddleStackView.addArrangedSubview(windLabel)
    
    windLabel.text = "1.2 mph"
    windLabel.textColor = .white
    windLabel.font = UIFont.systemFont(ofSize: 25)
  }
  
  func setupPressureIcon() {
    bottomRightStackView.addArrangedSubview(pressureIcon)
    
    pressureIcon.image = UIImage(named: "pressure_icon")
  }
  
  func setupPressureLabel() {
    bottomRightStackView.addArrangedSubview(pressureLabel)
    
    pressureLabel.text = "1009 hpa"
    pressureLabel.textColor = .white
    pressureLabel.font = UIFont.systemFont(ofSize: 25)
  }
  
  func setupSettingsButton() {
    addSubview(settingsButton)
    let settingsButtonConstraints = [
      settingsButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      settingsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
      settingsButton.heightAnchor.constraint(equalToConstant: 75),
      settingsButton.widthAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: settingsButtonConstraints)
    
    let image = UIImage(named: "settings_icon")
    settingsButton.setImage(image, for: .normal)
    
    settingsButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
  }
  
  func setupSearchBar() {
    addSubview(searchBar)
    let searchBarConstraints = [
      searchBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
      searchBar.leadingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: 50),
      searchBar.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
      searchBar.heightAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchBarConstraints)

    searchBar.placeholder = "Search"
    //searchBar.searchBarStyle = .minimal
    //searchBar.searchTextField.backgroundColor = .white
    let textField = UITextField()
    searchBar.addSubview(textField)
    textField.addTarget(self, action: #selector(textFieldTapped), for: .editingDidBegin)
  }
}
