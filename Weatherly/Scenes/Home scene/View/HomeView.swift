//
//  HomeView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 12/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

final class HomeView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHomeViewElements()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupHomeViewElements()
  }
  
  // MARK: - UI elements
  func setupHomeViewElements() {
    let headerImageView: UIImageView = {
      let headerImageView = UIImageView()
      headerImageView.image = UIImage(named: "header_image-clear-day")
      headerImageView.contentMode = .scaleAspectFit
      return headerImageView
    }()
    addSubview(headerImageView)
    
    let bodyImageView: UIImageView = {
      let bodyImageView = UIImageView()
      bodyImageView.image = UIImage(named: "body_image-clear-day")
      return bodyImageView
    }()
    addSubview(bodyImageView)
    
    let cityNameLabel: UILabel = {
      let cityNameLabel = UILabel()
      cityNameLabel.text = "London"
      cityNameLabel.textColor = .white
      cityNameLabel.textAlignment = .center
      cityNameLabel.font = UIFont.systemFont(ofSize: 50)
      return cityNameLabel
    }()
    addSubview(cityNameLabel)
    
    let temperatureLabel: UILabel = {
      let temperatureLabel = UILabel()
      temperatureLabel.text = "20°"
      temperatureLabel.textColor = .white
      temperatureLabel.textAlignment = .center
      temperatureLabel.font = UIFont.systemFont(ofSize: 60)
      return temperatureLabel
    }()
    addSubview(temperatureLabel)
    
    let summaryLabel: UILabel = {
      let summaryLabel = UILabel()
      summaryLabel.text = "Sunny"
      summaryLabel.textColor = .white
      summaryLabel.textAlignment = .center
      summaryLabel.font = UIFont.systemFont(ofSize: 20)
      return summaryLabel
    }()
    addSubview(summaryLabel)
    
    let leftStackView: UIStackView = {
      let leftStackView = UIStackView()
      leftStackView.distribution = .equalSpacing
      leftStackView.axis = .vertical
      leftStackView.alignment = .center
      return leftStackView
    }()
    addSubview(leftStackView)
    
    let rightStackView: UIStackView = {
      let rightStackView = UIStackView()
      rightStackView.distribution = .equalCentering
      rightStackView.axis = .vertical
      rightStackView.alignment = .center
      return rightStackView
    }()
    addSubview(rightStackView)
    
    let separatorView: UIView = {
      let separatorView = UIView()
      separatorView.backgroundColor = .white
      return separatorView
    }()
    addSubview(separatorView)
    
    let lowTemperature: UILabel = {
      let lowTemperature = UILabel()
      lowTemperature.text = "89.3° F"
      lowTemperature.textAlignment = .center
      lowTemperature.font = UIFont.systemFont(ofSize: 30)
      lowTemperature.textColor = .white
      return lowTemperature
    }()
    leftStackView.addArrangedSubview(lowTemperature)
    
    let lowTemperatureLabel: UILabel = {
      let lowTemperatureLabel = UILabel()
      lowTemperatureLabel.text = "Low"
      lowTemperatureLabel.textColor = .white
      lowTemperatureLabel.textAlignment = .center
      lowTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
      return lowTemperatureLabel
    }()
    leftStackView.addArrangedSubview(lowTemperatureLabel)
    
    let highTemperature: UILabel = {
      let highTemperature = UILabel()
      highTemperature.text = "95.4° F"
      highTemperature.textColor = .white
      highTemperature.textAlignment = .center
      highTemperature.font = UIFont.systemFont(ofSize: 30)
      return highTemperature
    }()
    rightStackView.addArrangedSubview(highTemperature)
    
    let highTemperatureLabel: UILabel = {
      let highTemperatureLabel = UILabel()
      highTemperatureLabel.text = "High"
      highTemperatureLabel.textColor = .white
      highTemperatureLabel.textAlignment = .center
      highTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
      return highTemperatureLabel
    }()
    rightStackView.addArrangedSubview(highTemperatureLabel)
    
    let bottomStackView: UIStackView = {
      let bottomStackView = UIStackView()
      bottomStackView.distribution = .fillEqually
      bottomStackView.axis = .horizontal
      bottomStackView.alignment = .center
      return bottomStackView
    }()
    addSubview(bottomStackView)
    
    let bottomLeftStackView: UIStackView = {
      let bottomLeftStackView = UIStackView()
      bottomLeftStackView.distribution = .equalCentering
      bottomLeftStackView.axis = .vertical
      bottomLeftStackView.alignment = .center
      return bottomLeftStackView
    }()
    bottomStackView.addArrangedSubview(bottomLeftStackView)
    
    let bottomMiddleStackView: UIStackView = {
      let bottomMiddleStackView = UIStackView()
      bottomMiddleStackView.axis = .vertical
      bottomMiddleStackView.alignment = .center
      bottomMiddleStackView.distribution = .equalCentering
      return bottomMiddleStackView
    }()
    bottomStackView.addArrangedSubview(bottomMiddleStackView)
    
    let bottomRightStackView: UIStackView = {
      let bottomRightStackView = UIStackView()
      bottomRightStackView.distribution = .equalCentering
      bottomRightStackView.axis = .vertical
      bottomRightStackView.alignment = .center
      return bottomRightStackView
    }()
    bottomStackView.addArrangedSubview(bottomRightStackView)
    
    let humidityIcon: UIImageView = {
      let humidityIcon = UIImageView()
      humidityIcon.image = UIImage(named: "humidity_icon")
      return humidityIcon
    }()
    bottomLeftStackView.addArrangedSubview(humidityIcon)
    
    let humidityLabel: UILabel = {
      let humidityLabel = UILabel()
      humidityLabel.text = "0.8%"
      humidityLabel.textColor = .white
      humidityLabel.font = UIFont.systemFont(ofSize: 25)
      return humidityLabel
    }()
    bottomLeftStackView.addArrangedSubview(humidityLabel)
    
    let windIcon: UIImageView = {
      let windIcon = UIImageView()
      windIcon.image = UIImage(named: "wind_icon")
      return windIcon
    }()
    bottomMiddleStackView.addArrangedSubview(windIcon)
    
    let windLabel: UILabel = {
      let windLabel = UILabel()
      windLabel.text = "1.2 mph"
      windLabel.textColor = .white
      windLabel.font = UIFont.systemFont(ofSize: 25)
      return windLabel
    }()
    bottomMiddleStackView.addArrangedSubview(windLabel)
    
    let pressureIcon: UIImageView = {
      let pressureIcon = UIImageView()
      pressureIcon.image = UIImage(named: "pressure_icon")
      return pressureIcon
    }()
    bottomRightStackView.addArrangedSubview(pressureIcon)
    
    let pressureLabel: UILabel = {
      let pressureLabel = UILabel()
      pressureLabel.text = "1009 hpa"
      pressureLabel.textColor = .white
      pressureLabel.font = UIFont.systemFont(ofSize: 25)
      return pressureLabel
    }()
    bottomRightStackView.addArrangedSubview(pressureLabel)
    
    let settingsButton: UIButton = {
      let settingsButton = UIButton()
      let image = UIImage(named: "settings_icon")
      settingsButton.setImage(image, for: .normal)
      return settingsButton
    }()
    addSubview(settingsButton)
    
    let searchBar: UISearchBar = {
      let searchBar = UISearchBar()
      searchBar.placeholder = "Search"
      searchBar.searchBarStyle = .minimal
      searchBar.searchTextField.backgroundColor = .white
      return searchBar
    }()
    addSubview(searchBar)
    
    //    MARK: - constraints
    let headerImageViewConstraints = [
      headerImageView.topAnchor.constraint(equalTo: topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      headerImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4, constant: 1)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: headerImageViewConstraints)
    
    let bodyImageViewConstraints = [
      bodyImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
      bodyImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      bodyImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      bodyImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 50)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bodyImageViewConstraints)
    
    let cityNameLabelConstraints = [
      cityNameLabel.topAnchor.constraint(equalTo: bodyImageView.topAnchor, constant: 40),
      cityNameLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
//      cityNameLabel.heightAnchor.constraint(equalToConstant: 100),
      cityNameLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: cityNameLabelConstraints)
    
    let temperatureLabelConstraints = [
      temperatureLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -50),
      temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
      temperatureLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      temperatureLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: temperatureLabelConstraints)
    
    let summaryLabelConstraints = [
      summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -10),
      summaryLabel.heightAnchor.constraint(equalToConstant: 50),
      summaryLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      summaryLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: summaryLabelConstraints)
    
    let leftStackViewConstraints = [
      leftStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      leftStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
      leftStackView.heightAnchor.constraint(equalToConstant: 75),
      leftStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: leftStackViewConstraints)
    
    let rightStackViewConstraints = [
      rightStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      rightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
      rightStackView.heightAnchor.constraint(equalToConstant: 75),
      rightStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: rightStackViewConstraints)
    
    let separatorViewConstraints = [
      separatorView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      separatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      separatorView.widthAnchor.constraint(equalToConstant: 5),
      separatorView.heightAnchor.constraint(equalTo: leftStackView.heightAnchor)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: separatorViewConstraints)
    
    let bottomStackViewConstraints = [
      bottomStackView.topAnchor.constraint(equalTo: leftStackView.bottomAnchor, constant: 50),
      bottomStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      bottomRightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      bottomStackView.heightAnchor.constraint(equalToConstant: 75),
      bottomStackView.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bottomStackViewConstraints)
    
    let settingsButtonConstraints = [
      settingsButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      settingsButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
      settingsButton.heightAnchor.constraint(equalToConstant: 75),
      settingsButton.widthAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: settingsButtonConstraints)
    
    let searchBarConstraints = [
      searchBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
      searchBar.leadingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: 50),
      searchBar.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -25),
      searchBar.heightAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchBarConstraints)
  }
}
