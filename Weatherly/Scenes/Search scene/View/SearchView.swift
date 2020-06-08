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
  private lazy var searchTableView = UITableView()
  private(set) lazy var searchBar = UISearchBar()
  private lazy var dismissButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  @objc func dismissButtonTapped() {
    dismissButtonActionHandler?()
  }
}

//MARK: - setup view
private extension SearchView {
  func setupView() {
    backgroundColor = .clear
    
    setupSearchTableView()
    setupSearchBar()
    setupDismissButton()
  }
  
  func setupSearchTableView() {
    addSubview(searchTableView)
    let searchTableViewConstraints = [
      searchTableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
      searchTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
      searchTableView.heightAnchor.constraint(equalToConstant: 150)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchTableViewConstraints)
    
    searchTableView.backgroundColor = .white
  }
  
  func setupSearchBar() {
    addSubview(searchBar)
    let searchBarConstraints = [
      searchBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      searchBar.heightAnchor.constraint(equalToConstant: 50)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: searchBarConstraints)
    
    searchBar.placeholder = "Search"
    //searchBar.searchBarStyle = .minimal
    //searchBar.searchTextField.backgroundColor = .white
  }
  
  func setupDismissButton() {
    addSubview(dismissButton)
    let dismissButtonConstraints = [
      dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      //      dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
      dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
      dismissButton.heightAnchor.constraint(equalToConstant: 30),
      dismissButton.widthAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: dismissButtonConstraints)
    
    dismissButton.backgroundColor = .blue
    
    dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
  }
}
