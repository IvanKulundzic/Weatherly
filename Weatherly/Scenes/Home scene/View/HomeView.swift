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
  var bodyImageView: UIImageView!
  var leftStackView: UIStackView!
  var rightStackView: UIStackView!
  var separatorView: UIView!
  var lowTemperature: UILabel!
  var lowTemperatureLabel: UILabel!
  var highTemperature: UILabel!
  var highTemperatureLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHomeView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupHomeView()
  }
}

private extension HomeView {
  func setupHomeView() {
    headerImageView = UIImageView()
    //    headerImageView.backgroundColor = .green
    headerImageView.image = UIImage(named: "header_image-clear-day")
    headerImageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(headerImageView)
    
    bodyImageView = UIImageView()
    //    bodyImageView.backgroundColor = .systemPink
    bodyImageView.image = UIImage(named: "body_image-clear-day")
    bodyImageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    
//    MARK: - constraints
    let headerImageViewConstraints = [
      headerImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      headerImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.3, constant: 1),
      headerImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
    ]
    NSLayoutConstraint.activate(headerImageViewConstraints)
    
    let bodyImageViewConstraints = [
      bodyImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
      bodyImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      bodyImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      bodyImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.7, constant: 1),
      bodyImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
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
  }
}
