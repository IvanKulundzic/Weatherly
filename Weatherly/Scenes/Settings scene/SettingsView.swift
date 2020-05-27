//
//  SettingsView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 27/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SettingsView: UIView {
  private lazy var locationsLabel = UILabel()
  private lazy var locationsListTableView = UITableView()
  private lazy var unitsLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
}

private extension SettingsView {
  func setupView() {
    backgroundColor = .green
    setupLocationsLabel()
    setupLocationsListTableView()
    setupUnitsLabel()
  }

  func setupLocationsLabel() {
    addSubview(locationsLabel)
    let locationsLabelConstraints = [
      locationsLabel.topAnchor.constraint(equalTo: topAnchor),
      locationsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      locationsLabel.heightAnchor.constraint(equalToConstant: 75),
      locationsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationsLabelConstraints)

    locationsLabel.text = "Location"
    locationsLabel.textAlignment = .center
    locationsLabel.textColor = .white
    locationsLabel.font = UIFont.systemFont(ofSize: 20)
  }
  
  func setupLocationsListTableView() {
    addSubview(locationsListTableView)
    let locationsListTableViewConstraints = [
      locationsListTableView.topAnchor.constraint(equalTo: locationsLabel.bottomAnchor, constant: 5),
      locationsListTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
      locationsListTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
      locationsListTableView.heightAnchor.constraint(equalToConstant: 75),
      unitsLabel.widthAnchor.constraint(equalToConstant: 100)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationsListTableViewConstraints)
    
    locationsListTableView.backgroundColor = .red
  }
  
  func setupUnitsLabel() {
    addSubview(unitsLabel)
    let unitsLabelConstraints = [
      unitsLabel.topAnchor.constraint(equalTo: locationsListTableView.bottomAnchor, constant: 10),
      unitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      unitsLabel.heightAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: unitsLabelConstraints)
    
    unitsLabel.text = "Units"
    unitsLabel.textAlignment = .center
    unitsLabel.textColor = .white
    unitsLabel.font = UIFont.systemFont(ofSize: 20)
  }
  
}
