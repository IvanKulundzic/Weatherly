//
//  SearchTableViewCell.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 15/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
  var location: Location? {
    didSet {
      print("Location in cell set")
    }
  }
  private(set) lazy var locationNameLabel = UILabel()
  private(set) lazy var locationFirstLetterLabel = UILabel()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
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
    setupLocationFirstLetterLabel()
    setupLocationNameLabel()
  }
  
  func setupLocationFirstLetterLabel() {
    addSubview(locationFirstLetterLabel)
    let locationFirstLetterLabelConstraints = [
      locationFirstLetterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      locationFirstLetterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      locationFirstLetterLabel.heightAnchor.constraint(equalToConstant: 30),
      locationFirstLetterLabel.widthAnchor.constraint(equalToConstant: 30)
      
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: locationFirstLetterLabelConstraints)
    
    locationFirstLetterLabel.backgroundColor = .gray
    locationFirstLetterLabel.textColor = .white
    locationFirstLetterLabel.textAlignment = .center
    locationFirstLetterLabel.font = UIFont.systemFont(ofSize: 20)
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
    locationNameLabel.font = UIFont.systemFont(ofSize: 20)
  }
}

