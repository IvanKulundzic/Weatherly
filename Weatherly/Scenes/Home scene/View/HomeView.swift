//
//  HomeView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 12/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

class HomeView: UIView {
  var cityNameLabel: UILabel!
  var temperatureLabel: UILabel!
  var summaryLabel: UILabel!
  var headerImageView: UIImageView!
//  var bodyImageView: UIImageView!
  var leftStackView: UIStackView!
  var rightStackView: UIStackView!
  var separatorView: UIView!
  var lowTemperature: UILabel!
  var lowTemperatureLabel: UILabel!
  var highTemperature: UILabel!
  var highTemperatureLabel: UILabel!
  var bottomStackView: UIStackView!
  var bottomLeftStackView: UIStackView!
  var bottomMiddleStackView: UIStackView!
  var bottomRightStackView: UIStackView!
  var humidityIcon: UIImageView!
  var humidityLabel: UILabel!
  var windIcon: UIImageView!
  var windLabel: UILabel!
  var pressureIcon: UIImageView!
  var pressureLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHomeView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupHomeView()
  }
}

// MARK: - View settup
private extension HomeView {
  func setupHomeView() {
//    headerImageView = UIImageView()
//        headerImageView.backgroundColor = .green
////    headerImageView.image = UIImage(named: "header_image-clear-day")
//    headerImageView.translatesAutoresizingMaskIntoConstraints = false
//    addSubview(headerImageView)
    
    let headerImageView: UIImageView = {
      let headerImageView = UIImageView()
      //       headerImageView.backgroundColor = .green
      headerImageView.image = UIImage(named: "header_image-clear-day")
      headerImageView.translatesAutoresizingMaskIntoConstraints = false
      return headerImageView
    }()
    addSubview(headerImageView)
    
    let bodyImageView: UIImageView = {
      let bodyImageView = UIImageView()
      bodyImageView.image = UIImage(named: "body_image-clear-day")
      bodyImageView.translatesAutoresizingMaskIntoConstraints = false
      return bodyImageView
    }()
    addSubview(bodyImageView)
    
    cityNameLabel = UILabel()
//        cityNameLabel.backgroundColor = .red
    cityNameLabel.text = "London"
    cityNameLabel.textColor = .white
    cityNameLabel.textAlignment = .center
    cityNameLabel.font = UIFont.systemFont(ofSize: 50)
    cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(cityNameLabel)
    
    temperatureLabel = UILabel()
//        temperatureLabel.backgroundColor = .yellow
    temperatureLabel.text = "20℃"
    temperatureLabel.textColor = .white
    temperatureLabel.textAlignment = .center
    temperatureLabel.font = UIFont.systemFont(ofSize: 50)
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(temperatureLabel)
    
    summaryLabel = UILabel()
//        summaryLabel.backgroundColor = .purple
    summaryLabel.text = "Sunny"
    summaryLabel.textColor = .white
    summaryLabel.textAlignment = .center
    summaryLabel.font = UIFont.systemFont(ofSize: 20)
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(summaryLabel)
    
    leftStackView = UIStackView()
    leftStackView.translatesAutoresizingMaskIntoConstraints = false
    leftStackView.distribution = .equalSpacing
    leftStackView.axis = .vertical
    leftStackView.alignment = .center
    addSubview(leftStackView)
    
    rightStackView = UIStackView()
    rightStackView.translatesAutoresizingMaskIntoConstraints = false
    rightStackView.distribution = .equalCentering
    rightStackView.axis = .vertical
    rightStackView.alignment = .center
    addSubview(rightStackView)
    
    separatorView = UIView()
    separatorView.translatesAutoresizingMaskIntoConstraints = false
    separatorView.backgroundColor = .white
    addSubview(separatorView)
    
    lowTemperature = UILabel()
    lowTemperature.translatesAutoresizingMaskIntoConstraints = false
    lowTemperature.text = "89.3 F ℃"
    lowTemperature.textAlignment = .center
    lowTemperature.font = UIFont.systemFont(ofSize: 30)
    lowTemperature.textColor = .white
//    lowTemperature.backgroundColor = .gray
    leftStackView.addArrangedSubview(lowTemperature)
    
    lowTemperatureLabel = UILabel()
    lowTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    lowTemperatureLabel.text = "Low"
    lowTemperatureLabel.textColor = .white
    lowTemperatureLabel.textAlignment = .center
    lowTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
//    lowTemperatureLabel.backgroundColor = .blue
    leftStackView.addArrangedSubview(lowTemperatureLabel)
    
    highTemperature = UILabel()
    highTemperature.translatesAutoresizingMaskIntoConstraints = false
    highTemperature.text = "95.4 F ℃"
    highTemperature.textColor = .white
    highTemperature.textAlignment = .center
    highTemperature.font = UIFont.systemFont(ofSize: 30)
//    highTemperature.backgroundColor = .red
    rightStackView.addArrangedSubview(highTemperature)
    
    highTemperatureLabel = UILabel()
    highTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    highTemperatureLabel.text = "High"
    highTemperatureLabel.textColor = .white
    highTemperatureLabel.textAlignment = .center
    highTemperatureLabel.font = UIFont.systemFont(ofSize: 30)
//    highTemperatureLabel.backgroundColor = .yellow
    rightStackView.addArrangedSubview(highTemperatureLabel)
    
    bottomStackView = UIStackView()
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomStackView.distribution = .fillEqually
    bottomStackView.axis = .horizontal
    bottomStackView.alignment = .center
    addSubview(bottomStackView)
    
    bottomLeftStackView = UIStackView()
    bottomLeftStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomLeftStackView.distribution = .equalCentering
    bottomLeftStackView.axis = .vertical
    bottomLeftStackView.alignment = .center
    bottomStackView.addArrangedSubview(bottomLeftStackView)
    
    bottomMiddleStackView = UIStackView()
    bottomMiddleStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomMiddleStackView.distribution = .equalCentering
    bottomMiddleStackView.axis = .vertical
    bottomMiddleStackView.alignment = .center
    bottomStackView.addArrangedSubview(bottomMiddleStackView)
    
    bottomRightStackView = UIStackView()
    bottomRightStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomRightStackView.distribution = .equalCentering
    bottomRightStackView.axis = .vertical
    bottomRightStackView.alignment = .center
    bottomStackView.addArrangedSubview(bottomRightStackView)
    
    humidityIcon = UIImageView()
    humidityIcon.translatesAutoresizingMaskIntoConstraints = false
    humidityIcon.image = UIImage(named: "humidity_icon")
    humidityIcon.backgroundColor = .red
    bottomLeftStackView.addArrangedSubview(humidityIcon)
    
    windIcon = UIImageView()
    windIcon.translatesAutoresizingMaskIntoConstraints = false
    windIcon.image = UIImage(named: "wind_icon")
    windIcon.backgroundColor = .red
    bottomMiddleStackView.addArrangedSubview(windIcon)
    
    pressureIcon = UIImageView()
    pressureIcon.translatesAutoresizingMaskIntoConstraints = false
    pressureIcon.image = UIImage(named: "pressure_icon")
    pressureIcon.backgroundColor = .red
    bottomRightStackView.addArrangedSubview(pressureIcon)
    
    humidityLabel = UILabel()
    humidityLabel.translatesAutoresizingMaskIntoConstraints = false
    humidityLabel.text = "0.8%"
    humidityLabel.textColor = .white
    humidityLabel.font = UIFont.systemFont(ofSize: 25)
    humidityLabel.backgroundColor = .red
    bottomLeftStackView.addArrangedSubview(humidityLabel)
    
    windLabel = UILabel()
    windLabel.translatesAutoresizingMaskIntoConstraints = false
    windLabel.text = "1.2 mph"
    windLabel.textColor = .white
    windLabel.font = UIFont.systemFont(ofSize: 25)
    windLabel.backgroundColor = .red
    bottomMiddleStackView.addArrangedSubview(windLabel)
    
    pressureLabel = UILabel()
    pressureLabel.translatesAutoresizingMaskIntoConstraints = false
    pressureLabel.text = "1009 hpa"
    pressureLabel.textColor = .white
    pressureLabel.font = UIFont.systemFont(ofSize: 25)
    pressureLabel.backgroundColor = .red
    bottomRightStackView.addArrangedSubview(pressureLabel)
    
    let settingsButton: UIButton = {
      let settingsButton = UIButton()
      settingsButton.translatesAutoresizingMaskIntoConstraints = false
      let image = UIImage(named: "settings_icon")
      settingsButton.setImage(image, for: .normal)
      return settingsButton
    }()
    addSubview(settingsButton)
    
    let searchBar: UISearchBar = {
      let searchBar = UISearchBar()
      searchBar.translatesAutoresizingMaskIntoConstraints = false
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
    NSLayoutConstraint.activate(headerImageViewConstraints)
    
    let bodyImageViewConstraints = [
      bodyImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
      bodyImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      bodyImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      bodyImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 50)
    ]
    NSLayoutConstraint.activate(bodyImageViewConstraints)
    
    let cityNameLabelConstraints = [
      cityNameLabel.topAnchor.constraint(equalTo: bodyImageView.topAnchor),
      //      cityNameLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -40),
      cityNameLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      cityNameLabel.heightAnchor.constraint(equalToConstant: 100),
      cityNameLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      //      cityNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -40)
    ]
    NSLayoutConstraint.activate(cityNameLabelConstraints)
    
    let temperatureLabelConstraints = [
      temperatureLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -50),
      temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
      temperatureLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      temperatureLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.activate(temperatureLabelConstraints)
    
    let summaryLabelConstraints = [
      summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -20),
      summaryLabel.heightAnchor.constraint(equalToConstant: 50),
      summaryLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, constant: -20),
      summaryLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.activate(summaryLabelConstraints)
    
    let leftStackViewConstraints = [
      leftStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      leftStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
//      leftStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -5),
      leftStackView.heightAnchor.constraint(equalToConstant: 75),
      leftStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.activate(leftStackViewConstraints)
    
    let rightStackViewConstraints = [
      rightStackView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      rightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
      //      leftStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -5),
      rightStackView.heightAnchor.constraint(equalToConstant: 75),
      rightStackView.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.activate(rightStackViewConstraints)
    
    let separatorViewConstraints = [
      separatorView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
      separatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      separatorView.widthAnchor.constraint(equalToConstant: 5),
      separatorView.heightAnchor.constraint(equalTo: leftStackView.heightAnchor)
    ]
    NSLayoutConstraint.activate(separatorViewConstraints)
    
    let bottomStackViewConstraints = [
      bottomStackView.topAnchor.constraint(equalTo: leftStackView.bottomAnchor, constant: 50),
      bottomStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      bottomRightStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      bottomStackView.heightAnchor.constraint(equalToConstant: 75),
//      bottomStackView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor)
    ]
    NSLayoutConstraint.activate(bottomStackViewConstraints)
    
    let settingsButtonConstraints = [
      settingsButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      settingsButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
      settingsButton.heightAnchor.constraint(equalToConstant: 75),
      settingsButton.widthAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.activate(settingsButtonConstraints)
    
    let searchBarConstraints = [
      searchBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
      searchBar.leadingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: 50),
      searchBar.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -25),
      searchBar.heightAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.activate(searchBarConstraints)
  }
}
