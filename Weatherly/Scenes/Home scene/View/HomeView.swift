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
  var stackView: UIStackView!
  
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
    //    cityNameLabel.backgroundColor = .red
    cityNameLabel.text = "London"
    cityNameLabel.textColor = .white
    cityNameLabel.textAlignment = .center
    cityNameLabel.font = UIFont.systemFont(ofSize: 30)
    cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(cityNameLabel)
    
    temperatureLabel = UILabel()
        temperatureLabel.backgroundColor = .yellow
    temperatureLabel.text = "20℃"
    temperatureLabel.textColor = .white
    temperatureLabel.textAlignment = .center
    temperatureLabel.font = UIFont.systemFont(ofSize: 30)
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(temperatureLabel)
    
    summaryLabel = UILabel()
        summaryLabel.backgroundColor = .purple
    summaryLabel.text = "Sunny"
    summaryLabel.textColor = .white
    summaryLabel.textAlignment = .center
    summaryLabel.font = UIFont.systemFont(ofSize: 30)
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(summaryLabel)
    
    let headerImageViewConstraints = [
      headerImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
      headerImageView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.3, constant: 1),
      headerImageView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
    ]
    NSLayoutConstraint.activate(headerImageViewConstraints)
    
    let bodyImageViewConstraints = [
      bodyImageView.topAnchor.constraint(equalTo: self.headerImageView.bottomAnchor),
      bodyImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
      bodyImageView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
      bodyImageView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.7, constant: 1),
      bodyImageView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
    ]
    NSLayoutConstraint.activate(bodyImageViewConstraints)
    
    let cityNameLabelConstraints = [
      cityNameLabel.topAnchor.constraint(equalTo: self.bodyImageView.topAnchor),
      //      cityNameLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -40),
      cityNameLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor),
      cityNameLabel.heightAnchor.constraint(equalToConstant: 100),
      cityNameLabel.widthAnchor.constraint(equalToConstant: 100),
      //      cityNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -40)
    ]
    NSLayoutConstraint.activate(cityNameLabelConstraints)
    
    let temperatureLabelConstraints = [
      temperatureLabel.bottomAnchor.constraint(equalTo: self.cityNameLabel.topAnchor, constant: 10),
      temperatureLabel.heightAnchor.constraint(equalToConstant: 100),
      temperatureLabel.widthAnchor.constraint(equalToConstant: 100),
      temperatureLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.activate(temperatureLabelConstraints)
    
    let summaryLabelConstraints = [
      summaryLabel.topAnchor.constraint(equalTo: self.temperatureLabel.bottomAnchor),
      summaryLabel.heightAnchor.constraint(equalToConstant: 100),
      summaryLabel.widthAnchor.constraint(equalToConstant: 100),
      summaryLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor)
    ]
    NSLayoutConstraint.activate(summaryLabelConstraints)
  }
}
