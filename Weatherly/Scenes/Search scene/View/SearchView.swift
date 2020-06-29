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
  let cellId = "cellId"
  private(set) lazy var searchTableView = UITableView()
  private(set) lazy var textField = CustomTextField()
  private(set) lazy var activityIndicatorView = UIActivityIndicatorView()
  private lazy var dismissButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
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
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    UIView.animate(withDuration: 0.7) { [weak self] in
      self?.setupTextField2()
    }
    return true
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
    setupActivityIndicatorView()
    //setupTapGesture()
  }
  
  func setupSearchTableView() {
    addSubview(searchTableView)
    let searchTableViewConstraints = [
      searchTableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
      searchTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      searchTableView.heightAnchor.constraint(equalToConstant: 500)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchTableViewConstraints)
    
    searchTableView.backgroundColor = .clear
    searchTableView.estimatedRowHeight = 30
    searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  func setupTextField2() {
//    addSubview(textField)
//    let textFieldConstraints = [
////      textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
//      textField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 10),
////      textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
////      textField.heightAnchor.constraint(equalToConstant: 40)
//    ]
//    NSLayoutConstraint.useAndActivateConstraints(constraints: textFieldConstraints)
//
//    let textFieldFrame = textField.frame
//    print(textFieldFrame)
////    textField.frame.origin.x = 10.0
    let newFrame = CGRect(x: 10.0, y: 758.0, width: 324.0, height: 40.0)
    textField.frame = newFrame
//    let newConstraint = textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
//    newConstraint.isActive = true
    
  }
  
  func setupTextField() {
    addSubview(textField)
    let newFrame = CGRect(x: 60.0, y: 758.0, width: 324.0, height: 40.0)
    textField.frame = newFrame
    let textFieldConstraints = [
      textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
      textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -10),
      textField.heightAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: textFieldConstraints)
    
    textField.placeholder = "Search"
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 20.0
    textField.layer.masksToBounds = true
    print("1", textField.frame)
    textField.becomeFirstResponder()
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
  
  func setupActivityIndicatorView() {
    addSubview(activityIndicatorView)
    let activityIndicatorConstraints = [
      activityIndicatorView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
      activityIndicatorView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
      activityIndicatorView.heightAnchor.constraint(equalToConstant: 40),
      activityIndicatorView.widthAnchor.constraint(equalToConstant: 40)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: activityIndicatorConstraints)
    
    activityIndicatorView.style = .whiteLarge
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
