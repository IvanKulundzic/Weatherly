//
//  SettingsTableViewCell.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 24/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
  var removeButtonActionHandler: Action?
  private(set) lazy var locationNameLabel = UILabel()
  private(set) lazy var removeButton = UIButton()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - setup cell and subviews
private extension SettingsTableViewCell {
  func setupCell() {
    backgroundColor = .clear
    setupRemoveButton()
    setupLocationNameLabel()
  }
  
  func setupRemoveButton() {
    addSubview(removeButton)
    let locationFirstLetterLabelConstraints = [
      removeButton.topAnchor.constraint(equalTo: topAnchor),
      removeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      removeButton.heightAnchor.constraint(equalToConstant: 30),
      removeButton.widthAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationFirstLetterLabelConstraints)
    
    removeButton.backgroundColor = .gray
    removeButton.setTitle("x", for: .normal)
    removeButton.setTitleColor(.white, for: .normal)
    removeButton.titleLabel?.font = .getGothamFont(size: 20, weight: .book)
    removeButton.titleLabel?.textAlignment = .center
    
    removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
  }
  
  @objc func removeButtonTapped() {
    print("Remove button tapped")
    removeButtonActionHandler?()
  }
  
  func setupLocationNameLabel() {
    addSubview(locationNameLabel)
    let locationNameLabelConstraints = [
      locationNameLabel.topAnchor.constraint(equalTo: topAnchor),
      locationNameLabel.leadingAnchor.constraint(equalTo: removeButton.trailingAnchor, constant: 5),
      locationNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      locationNameLabel.heightAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationNameLabelConstraints)
    
    locationNameLabel.textColor = .white
    locationNameLabel.textAlignment = .left
    locationNameLabel.font = .getGothamFont(size: 20, weight: .book)
  }
}
