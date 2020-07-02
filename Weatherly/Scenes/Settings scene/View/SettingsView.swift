//
//  SettingsView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 27/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SettingsView: UIView {
  var doneButtonActionHandler: Action?
  let cellId = "settingsCell"
  var units: String = "si"
  var hideHumidity: Bool? {
    didSet {
      if (hideHumidity == true) {
        humidityButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
      } else {
        humidityButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
      }
    }
  }
  
  var hideWind: Bool? {
    didSet {
      if (hideWind == true) {
        windButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
      } else {
        windButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
      }
    }
  }
  
  var hidePressure: Bool? {
    didSet {
      if (hidePressure == true) {
        pressureButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
      } else {
        pressureButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
      }
    }
  }
  
  var city: City?
  
  private(set) lazy var locationsListTableView = UITableView()
  private lazy var locationsLabel = UILabel()
  private lazy var unitsLabel = UILabel()
  private lazy var metricUnitsLabel = UILabel()
  private lazy var imperialUnitsLabel = UILabel()
  private lazy var metricUnitsButton = UIButton()
  private lazy var imperialUnitsButton = UIButton()
  private lazy var conditionsLabel = UILabel()
  private lazy var humidityIcon = UIImageView()
  private lazy var humidityButton = UIButton()
  private lazy var windIcon = UIImageView()
  private lazy var windButton = UIButton()
  private lazy var pressureIcon = UIImageView()
  private lazy var pressureButton = UIButton()
  private lazy var doneButton = UIButton()
  private lazy var closeButton = UIButton()
  private lazy var bottomStackView = UIStackView()
  private lazy var bottomLeftStackView = UIStackView()
  private lazy var bottomMiddleStackView = UIStackView()
  private lazy var bottomRightStackView = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

// MARK: - doneButton tapped
extension SettingsView {
  @objc func doneButtonTapped() {
    let userDefaults = UserDefaults.standard
    userDefaults.set(units, forKey: "units")
    doneButtonActionHandler?()
  }
}

// MARK: - view setup
private extension SettingsView {
  func setupView() {
    backgroundColor = .clear
    setupLocationsLabel()
    setupLocationsListTableView()
    setupUnitsLabel()
    setupMetricUnitsButton()
    setupMetricUnitsLabel()
    setupImperialUnitsButton()
    setupImperialUnitsLabel()
    setupConditionsLabel()
    setupBottomStackView()
    setupBottomLeftStackView()
    setupBottomMiddleStackView()
    setupBottomRightStackView()
    setupHumidityIcon()
    setupHumidityButton()
    setupWindIcon()
    setupWindButton()
    setupPressureIcon()
    setupPressureButton()
    setupDoneButton()
  }
  
  func setupLocationsLabel() {
    addSubview(locationsLabel)
    let locationsLabelConstraints = [
      locationsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      locationsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      locationsLabel.heightAnchor.constraint(equalToConstant: 50),
      locationsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationsLabelConstraints)
    locationsLabel.text = "Location"
    locationsLabel.textAlignment = .center
    locationsLabel.textColor = .white
    locationsLabel.font = .getGothamFont(size: 20, weight: .book)
  }
  
  func setupLocationsListTableView() {
    addSubview(locationsListTableView)
    let locationsListTableViewConstraints = [
      locationsListTableView.topAnchor.constraint(equalTo: locationsLabel.bottomAnchor, constant: 5),
      locationsListTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
      locationsListTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
      locationsListTableView.heightAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationsListTableViewConstraints)
    locationsListTableView.backgroundColor = .clear
    locationsListTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellId)
    locationsListTableView.rowHeight = 30.0
  }
  
  func setupUnitsLabel() {
    addSubview(unitsLabel)
    let unitsLabelConstraints = [
      unitsLabel.topAnchor.constraint(equalTo: locationsListTableView.bottomAnchor, constant: 10),
      unitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      unitsLabel.heightAnchor.constraint(equalToConstant: 50),
      unitsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: unitsLabelConstraints)
    unitsLabel.text = "Units"
    unitsLabel.textAlignment = .center
    unitsLabel.textColor = .white
    unitsLabel.font = .getGothamFont(size: 20, weight: .book)
  }
  
  func setupMetricUnitsButton() {
    addSubview(metricUnitsButton)
    let metricUnitsButtonConstraints = [
      metricUnitsButton.topAnchor.constraint(equalTo: unitsLabel.bottomAnchor, constant: 10),
      metricUnitsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      metricUnitsButton.heightAnchor.constraint(equalToConstant: 40),
      metricUnitsButton.widthAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: metricUnitsButtonConstraints)
    let defaults = UserDefaults.standard
    if defaults.object(forKey: "units") as! String == "us" {
      print("Checking units", defaults.object(forKey: "units") as! String)
      metricUnitsButton.setImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
    } else {
      metricUnitsButton.setImage(UIImage(named: "square_checkmark_check"), for: .normal)
    }
    
//    metricUnitsButton.setImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
    metricUnitsButton.addTarget(self, action: #selector(metricsButtonTapped), for: .touchUpInside)
  }
  
  @objc func metricsButtonTapped() {
    metricUnitsButton.setImage(UIImage(named: "square_checkmark_check"), for: .normal)
    imperialUnitsButton.setImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
    units = "si"
  }
  
  func setupMetricUnitsLabel() {
    addSubview(metricUnitsLabel)
    let metricUnitsLabelConstraints = [
      metricUnitsLabel.topAnchor.constraint(equalTo: unitsLabel.bottomAnchor, constant: 10),
      metricUnitsLabel.leadingAnchor.constraint(equalTo: metricUnitsButton.trailingAnchor, constant: 10),
      metricUnitsLabel.heightAnchor.constraint(equalToConstant: 40),
      metricUnitsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: metricUnitsLabelConstraints)
    metricUnitsLabel.text = "Metric"
    metricUnitsLabel.textColor = .white
    metricUnitsLabel.textAlignment = .left
    metricUnitsLabel.font = .getGothamFont(size: 20, weight: .book)
  }
  
  func setupImperialUnitsButton() {
    addSubview(imperialUnitsButton)
    let imperialUnitsButtonConstraints = [
      imperialUnitsButton.topAnchor.constraint(equalTo: metricUnitsButton.bottomAnchor),
      imperialUnitsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      imperialUnitsButton.heightAnchor.constraint(equalToConstant: 40),
      imperialUnitsButton.widthAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: imperialUnitsButtonConstraints)
    
    let defaults = UserDefaults.standard
    if defaults.object(forKey: "units") as! String == "us" {
      print("Checking units in imperial", defaults.object(forKey: "units") as! String)
      imperialUnitsButton.setImage(UIImage(named: "square_checkmark_check"), for: .normal)
    } else {
      imperialUnitsButton.setImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
    }
    imperialUnitsButton.addTarget(self, action: #selector(imperialButtonTapped), for: .touchUpInside)
  }
  
  @objc func imperialButtonTapped() {
    metricUnitsButton.setImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
    imperialUnitsButton.setImage(UIImage(named: "square_checkmark_check"), for: .normal)
    units = "us"
  }
  
  func setupImperialUnitsLabel() {
    addSubview(imperialUnitsLabel)
    let imperialUnitsLabelConstraints = [
      imperialUnitsLabel.topAnchor.constraint(equalTo: metricUnitsLabel.bottomAnchor, constant: 1),
      imperialUnitsLabel.leadingAnchor.constraint(equalTo: imperialUnitsButton.trailingAnchor, constant: 10),
      imperialUnitsLabel.heightAnchor.constraint(equalToConstant: 40),
      imperialUnitsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: imperialUnitsLabelConstraints)
    imperialUnitsLabel.text = "Imperial"
    imperialUnitsLabel.textColor = .white
    imperialUnitsLabel.textAlignment = .left
    imperialUnitsLabel.font = .getGothamFont(size: 20, weight: .book)
  }
  
  func setupConditionsLabel() {
    addSubview(conditionsLabel)
    let conditionsLabelConstraints = [
      conditionsLabel.topAnchor.constraint(equalTo: imperialUnitsLabel.bottomAnchor, constant: 10),
      conditionsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      conditionsLabel.heightAnchor.constraint(equalToConstant: 50),
      conditionsLabel.widthAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: conditionsLabelConstraints)
    conditionsLabel.text = "Conditions"
    conditionsLabel.textAlignment = .center
    conditionsLabel.textColor = .white
    conditionsLabel.font = .getGothamFont(size: 20, weight: .book)
  }
  
  func setupBottomStackView() {
    addSubview(bottomStackView)
    let bottomStackViewConstraints = [
      bottomStackView.topAnchor.constraint(equalTo: conditionsLabel.bottomAnchor, constant: 15),
      bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
      bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
      bottomStackView.heightAnchor.constraint(equalToConstant: 75)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: bottomStackViewConstraints)
    bottomStackView.distribution = .fillEqually
    bottomStackView.axis = .horizontal
    bottomStackView.alignment = .center
  }
  
  func setupBottomLeftStackView() {
    bottomStackView.addArrangedSubview(bottomLeftStackView)
    bottomLeftStackView.distribution = .equalCentering
    bottomLeftStackView.spacing = 10.0
    bottomLeftStackView.axis = .vertical
    bottomLeftStackView.alignment = .center
  }
  
  func setupBottomMiddleStackView() {
    bottomStackView.addArrangedSubview(bottomMiddleStackView)
    bottomMiddleStackView.distribution = .equalCentering
    bottomMiddleStackView.spacing = 10.0
    bottomMiddleStackView.axis = .vertical
    bottomMiddleStackView.alignment = .center
  }
  
  func setupBottomRightStackView() {
    bottomStackView.addArrangedSubview(bottomRightStackView)
    bottomRightStackView.distribution = .equalCentering
    bottomRightStackView.spacing = 10.0
    bottomRightStackView.axis = .vertical
    bottomRightStackView.alignment = .center
  }
  
  func setupHumidityIcon() {
    bottomLeftStackView.addArrangedSubview(humidityIcon)
    humidityIcon.image = UIImage(named: "humidity_icon")
  }
  
  func setupHumidityButton() {
    bottomLeftStackView.addArrangedSubview(humidityButton)
    humidityButton.addTarget(self, action: #selector(humidityButtonTapped), for: .touchUpInside)
  }
  
  @objc func humidityButtonTapped() {
    if hideHumidity == true {
      hideHumidity = false
      humidityButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
    } else {
      hideHumidity = true
      humidityButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
    }
  }
  
  func setupWindIcon() {
    bottomMiddleStackView.addArrangedSubview(windIcon)
    windIcon.image = UIImage(named: "wind_icon")
  }
  
  func setupWindButton() {
    bottomMiddleStackView.addArrangedSubview(windButton)
    windButton.addTarget(self, action: #selector(windButtonTapped), for: .touchUpInside)
  }
  
  @objc func windButtonTapped() {
    if hideWind == true {
      hideWind = false
      windButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
    } else {
      hideWind = true
      windButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
    }
  }
  
  func setupPressureIcon() {
    bottomRightStackView.addArrangedSubview(pressureIcon)
    pressureIcon.image = UIImage(named: "pressure_icon")
  }
  
  func setupPressureButton() {
    bottomRightStackView.addArrangedSubview(pressureButton)
    pressureButton.addTarget(self, action: #selector(pressureButtonTapped), for: .touchUpInside)
  }
  
  @objc func pressureButtonTapped() {
    if hidePressure == true {
      hidePressure = false
      pressureButton.setImage(UIImage(named: "checkmark_check"), for: .normal)
    } else {
      hidePressure = true
      pressureButton.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
    }
  }
  
  func setupDoneButton() {
    addSubview(doneButton)
    let doneButtonConstraints = [
      doneButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      doneButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
      doneButton.widthAnchor.constraint(equalToConstant: 100),
      doneButton.heightAnchor.constraint(equalToConstant: 50)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: doneButtonConstraints)
    doneButton.setTitle("Done", for: .normal)
    doneButton.setTitleColor(.systemGreen, for: .normal)
    doneButton.titleLabel?.font = .getGothamFont(size: 20, weight: .book)
    doneButton.backgroundColor = .white
    doneButton.layer.cornerRadius = 25    
    doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
  }
}
