//
//  SearchView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 29/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

final class SearchView: UIView {
  var dismissButtonActionHandler: Action?
  var textFieldActionHandler: ((String) -> Void)?
  private(set) lazy var searchTableView = UITableView()
  private(set) lazy var textField = UITextField()
  private lazy var dismissButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    
    //    let tapGesture = UITapGestureRecognizer()
    //    tapGesture.
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
}

// MARK: - textField delegate
extension SearchView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let output = textField.text else { print("No textField text"); return }
    textFieldActionHandler?(output)
  }
}

//MARK: - setup view
extension SearchView {
  func setupView() {
    textField.delegate = self
    backgroundColor = .clear
    
    setupSearchTableView()
    setupTextField()
    setupDismissButton()
    //setupTapGesture()
  }
  
  func setupSearchTableView() {
    addSubview(searchTableView)
    let searchTableViewConstraints = [
      searchTableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
      searchTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
      searchTableView.heightAnchor.constraint(equalToConstant: 500)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchTableViewConstraints)
    
    searchTableView.backgroundColor = .clear
    searchTableView.estimatedRowHeight = 30
    searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "cellId")
  }
  
  func setupTextField() {
    addSubview(textField)
    let textFieldConstraints = [
      textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      textField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 10),
      textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
      textField.heightAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: textFieldConstraints)
    
    textField.placeholder = "Search"
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 20.0
    textField.layer.masksToBounds = true    
  }
  
  func setupDismissButton() {
    addSubview(dismissButton)
    let dismissButtonConstraints = [
      dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      dismissButton.heightAnchor.constraint(equalToConstant: 30),
      dismissButton.widthAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: dismissButtonConstraints)
    
    dismissButton.backgroundColor = .gray
    dismissButton.setTitle("X", for: .normal)
    dismissButton.setTitleColor(.darkGray, for: .normal)
    dismissButton.layer.cornerRadius = 15
    
    dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
  }
  
  @objc func dismissButtonTapped() {
    dismissButtonActionHandler?()
  }
}

// MARK: - tap gesture hides keyboard
private extension SearchView {
  func setupTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    addGestureRecognizer(tapGesture)
  }
  
  @objc func handleTap() {
    textField.resignFirstResponder()
    endEditing(true)
  }
}
