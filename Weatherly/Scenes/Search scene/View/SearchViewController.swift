//
//  SearchViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 29/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController {
  private lazy var searchView = SearchView()
  private lazy var blurView = UIVisualEffectView()
  private lazy var searchViewModel = SearchViewModel()
  
  var locations: [Geonames]?
  
  override func loadView() {
    view = searchView
  }
  
  override func viewDidLoad() {
    searchView.searchTableView.dataSource = self
    setupBlurView()
    addKeyboardObservers()
    searchViewDismissButtonTapped()
    handleTextFieldUserInput()
  }
  
  func updateUI() {
    print("Array: \(String(describing: locations))")
    
  }
}

// MARK: - tableView data source
extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .blue
    cell.textLabel?.text = locations?[indexPath.row].name
    return cell
  }
}

// MARK: - add keyboard observers; keyboard handling
private extension SearchViewController {
  func addKeyboardObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboardFrame = keyboardSize.cgRectValue
    let searchBarInitialPosition = searchView.textField.frame.origin.y
    if self.searchView.textField.frame.origin.y == searchBarInitialPosition {
      self.searchView.textField.frame.origin.y -= keyboardFrame.height
    }
    else {
      print("Else block")
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboardFrame = keyboardSize.cgRectValue
    let searchBarInitialPosition = searchView.textField.frame.origin.y
    if self.searchView.textField.frame.origin.y != searchBarInitialPosition + keyboardFrame.height {
      self.searchView.textField.frame.origin.y = 748.0
    }
  }
}

// MARK: - textField output
private extension SearchViewController {
  func handleTextFieldUserInput() {
    searchView.textFieldActionHandler = { [weak self] output in
      self?.searchViewModel.searchLocation(input: output)
    }
    
    searchViewModel.searchActionHandler = { [weak self] in
      self?.locations = self?.searchViewModel.location?.geonames
      self?.searchView.searchTableView.reloadData()
    }
  }
}

// MARK: - dismissButton tapped
private extension SearchViewController {
  func searchViewDismissButtonTapped() {
    searchView.dismissButtonActionHandler = { [weak self] in
      self?.dismiss(animated: true)
    }
  }
}

// MARK: - add blur effect
private extension SearchViewController {
  func setupBlurView() {
    view.insertSubview(blurView, at: 0)
    let blurViewConstraints = [
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ]
    NSLayoutConstraint.useAndActivateConstraints(constraints: blurViewConstraints)
    
    blurView.effect = UIBlurEffect(style: .light)
  }
}
