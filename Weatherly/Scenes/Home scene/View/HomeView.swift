//
//  HomeView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 12/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class HomeView: UIView {
  var settingsButtonActionHandler: Action?
  var textFieldActionHandler: Action?
  private(set) lazy var activityIndicatorView = UIActivityIndicatorView()
  private(set) lazy var textField = CustomTextField()
  private lazy var headerImageView = UIImageView()
  private lazy var bodyImageView = UIImageView()
  private lazy var gradientView = GradientView()
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
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
  
  var gradient: [UIColor]? {
    get { return [.red, .blue] }
    set {
      guard let firstColor = newValue?[0] else { return }
      guard let secondColor = newValue?[1] else { return }
      gradientView.setupViewAndGradientLayer(colorOne: firstColor, colorTwo: secondColor)      
    }
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
  
  var hideHumidity: Bool? {
    get { humidityLabel.isHidden }
    set { humidityLabel.isHidden = newValue ?? false
      humidityIcon.isHidden = newValue ?? false
    }
  }
  
  var hideWind: Bool? {
    get { windLabel.isHidden }
    set { windLabel.isHidden = newValue ?? false
      windIcon.isHidden = newValue ?? false
    }
  }
  
  var hidePressure: Bool? {
    get { pressureLabel.isHidden }
    set { pressureLabel.isHidden = newValue ?? false
      pressureIcon.isHidden = newValue ?? false
    }
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

// MARK: - textField tapped
extension HomeView: UITextFieldDelegate {
  @objc func textFieldTapped() {
    textField.delegate = self
    textFieldActionHandler?()
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
    setupHeaderImageView()
    setupBodyImageView()
    setupGradientView()
    setupTemperatureLabel()
    setupSummaryLabel()
    setupCityNameLabel()
    setupLeftStackView()
    setupRightStackView()
    setupSeparatorView()
    setupLowTemperature()
    setupLowTemperatureLabel()
    setupHighTemperature()
    setupHighTemperatureLabel()
    setupSettingsButton()
    setupTextField()
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
    setupActivityIndicator()
  }
  
  func setupHeaderImageView() {
    addSubview(headerImageView)
//    headerImageView.snp.makeConstraints { make in
//      make.top.equalTo(self.snp.top)
//      make.left.equalToSuperview()
//      make.right.equalToSuperview()
//      make.height.equalTo(self.snp.height)
//    }
//
    let headerImageViewConstraints = [
      headerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      headerImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3, constant: 1)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: headerImageViewConstraints)
    
    headerImageView.contentMode = .scaleAspectFit
    headerImageView.backgroundColor = .clear
  }
  
  func setupGradientView() {
    insertSubview(gradientView, at: 0)
    let gradientViewConstraints = [
      gradientView.topAnchor.constraint(equalTo: topAnchor),
      gradientView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      gradientView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      gradientView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7, constant: 1)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: gradientViewConstraints)
  }
  
  func setupBodyImageView() {
    addSubview(bodyImageView)
    bodyImageView.snp.makeConstraints { (make) in
      make.top.equalTo(headerImageView.snp.bottom)
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(40)
    }
  }
  
  func setupCityNameLabel() {
    addSubview(cityNameLabel)
    let cityNameLabelConstraints = [
      //cityNameLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 100),
      cityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
      cityNameLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      cityNameLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: cityNameLabelConstraints)
    
    cityNameLabel.textColor = .white
    cityNameLabel.textAlignment = .center
    cityNameLabel.font = .getGothamFont(size: 36, weight: .book)
  }
  
  func setupTemperatureLabel() {
    addSubview(temperatureLabel)
    let temperatureLabelConstraints = [
      temperatureLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 10),
      temperatureLabel.heightAnchor.constraint(equalToConstant: 60),
      temperatureLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      temperatureLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: temperatureLabelConstraints)
    
    temperatureLabel.textColor = .white
    temperatureLabel.textAlignment = .center
    temperatureLabel.font = .getGothamFont(size: 72, weight: .light)
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
    
    summaryLabel.textColor = .white
    summaryLabel.textAlignment = .center
    summaryLabel.font = .getGothamFont(size: 24, weight: .light)
  }
  
  func setupLeftStackView() {
    addSubview(leftStackView)
    let leftStackViewConstraints = [
      leftStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 30),
      //leftStackView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: 15),
      leftStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
      leftStackView.heightAnchor.constraint(equalToConstant: 60),
      leftStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: leftStackViewConstraints)
    
    leftStackView.distribution = .equalCentering
    leftStackView.axis = .vertical
    leftStackView.alignment = .fill
  }
  
  func setupRightStackView() {
    addSubview(rightStackView)
    let rightStackViewConstraints = [
      rightStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 30),
      rightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
      rightStackView.heightAnchor.constraint(equalToConstant: 60),
      rightStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: rightStackViewConstraints)
    
    rightStackView.distribution = .equalCentering
    rightStackView.axis = .vertical
    rightStackView.alignment = .fill
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    let separatorViewConstraints = [
      separatorView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 30),
      separatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      separatorView.widthAnchor.constraint(equalToConstant: 2),
      separatorView.heightAnchor.constraint(equalTo: leftStackView.heightAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: separatorViewConstraints)
    
    separatorView.backgroundColor = .white
  }
  
  func setupLowTemperature() {
    leftStackView.addArrangedSubview(lowTemperature)

    lowTemperature.textAlignment = .center
    lowTemperature.font = .getGothamFont(size: 24, weight: .light)
    lowTemperature.textColor = .white
  }
  
  func setupLowTemperatureLabel() {
    leftStackView.addArrangedSubview(lowTemperatureLabel)
    
    lowTemperatureLabel.text = "Low"
    lowTemperatureLabel.textColor = .white
    lowTemperatureLabel.textAlignment = .center
    lowTemperatureLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupHighTemperature() {
    rightStackView.addArrangedSubview(highTemperature)
    
    highTemperature.textColor = .white
    highTemperature.textAlignment = .center
    highTemperature.font = .getGothamFont(size: 24, weight: .light)
  }
  
  func setupHighTemperatureLabel() {
    rightStackView.addArrangedSubview(highTemperatureLabel)
    
    highTemperatureLabel.text = "High"
    highTemperatureLabel.textColor = .white
    highTemperatureLabel.textAlignment = .center
    highTemperatureLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupBottomStackView() {
    addSubview(bottomStackView)
    let bottomStackViewConstraints = [
      bottomStackView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -50),
      bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      bottomStackView.heightAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bottomStackViewConstraints)
    
    bottomStackView.distribution = .fillEqually
    bottomStackView.axis = .horizontal
    bottomStackView.alignment = .fill
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
    
    humidityLabel.textColor = .white
    humidityLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupWindIcon() {
    bottomMiddleStackView.addArrangedSubview(windIcon)
    
    windIcon.image = UIImage(named: "wind_icon")
  }
  
  func setupWindLabel() {
    bottomMiddleStackView.addArrangedSubview(windLabel)
    
    windLabel.textColor = .white
    windLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupPressureIcon() {
    bottomRightStackView.addArrangedSubview(pressureIcon)
    
    pressureIcon.image = UIImage(named: "pressure_icon")
  }
  
  func setupPressureLabel() {
    bottomRightStackView.addArrangedSubview(pressureLabel)
    
    pressureLabel.textColor = .white
    pressureLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupSettingsButton() {
    addSubview(settingsButton)
    let settingsButtonConstraints = [
      settingsButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      settingsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      settingsButton.heightAnchor.constraint(equalToConstant: 40),
      settingsButton.widthAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: settingsButtonConstraints)
    
    let image = UIImage(named: "settings_icon")
    settingsButton.setImage(image, for: .normal)
    settingsButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
  }
  
  func setupTextField() {
    addSubview(textField)
    let textFieldConstraints = [
//      textField.topAnchor.constraint(equalTo: settingsButton.topAnchor, constant: 15),
      textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      textField.leadingAnchor.constraint(equalTo: settingsButton.trailingAnchor, constant: 5),
      textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
      textField.heightAnchor.constraint(equalToConstant: 40)
      
//      textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
//      textField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 10),
//      textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
//      textField.heightAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: textFieldConstraints)

    textField.placeholder = "Search"
    
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 20.0
    textField.layer.masksToBounds = true
    
    textField.addTarget(self, action: #selector(textFieldTapped), for: .editingDidBegin)
  }
  
  func setupActivityIndicator() {
    addSubview(activityIndicatorView)
    let activityIndicatorConstraints = [
      activityIndicatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      activityIndicatorView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
      activityIndicatorView.heightAnchor.constraint(equalToConstant: 40),
      activityIndicatorView.widthAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: activityIndicatorConstraints)
    activityIndicatorView.style = .whiteLarge
  }
}
