//
//  SearchTableViewCell.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 15/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
  private(set) lazy var locationNameLabel = UILabel()
  private(set) lazy var locationFirstLetterLabel = UILabel()
  
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
private extension SearchTableViewCell {
  func setupCell() {
    backgroundColor = .clear
    setupLocationFirstLetterLabel()
    setupLocationNameLabel()
  }
  
  func setupLocationFirstLetterLabel() {
    addSubview(locationFirstLetterLabel)
    let locationFirstLetterLabelConstraints = [
      locationFirstLetterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      locationFirstLetterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      locationFirstLetterLabel.heightAnchor.constraint(equalToConstant: 30),
      locationFirstLetterLabel.widthAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationFirstLetterLabelConstraints)    
    locationFirstLetterLabel.backgroundColor = .gray
    locationFirstLetterLabel.textColor = .white
    locationFirstLetterLabel.textAlignment = .center
    locationFirstLetterLabel.font = .getGothamFont(size: 20, weight: .light)
  }
  
  func setupLocationNameLabel() {
    addSubview(locationNameLabel)
    let locationNameLabelConstraints = [
      locationNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      locationNameLabel.leadingAnchor.constraint(equalTo: locationFirstLetterLabel.trailingAnchor, constant: 5),
      locationNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      locationNameLabel.heightAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationNameLabelConstraints)
    locationNameLabel.backgroundColor = .clear
    locationNameLabel.textColor = .white
    locationNameLabel.textAlignment = .left
    locationNameLabel.font = .getGothamFont(size: 20, weight: .light)
  }
}
