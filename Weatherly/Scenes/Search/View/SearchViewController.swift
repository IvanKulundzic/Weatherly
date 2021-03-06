//
//  SearchViewController.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 29/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol SearchViewControllerDelegate: class {
  var city: City? { get set }
}

final class SearchViewController: UIViewController {
  let cellId = "cellId"
  var delegate: SearchViewControllerDelegate?
  private let path = Realm.Configuration.defaultConfiguration.fileURL
  private lazy var searchView = SearchView()
  private lazy var searchViewModel = SearchViewModel()
  private lazy var blurView = UIVisualEffectView()
  
  override func loadView() {
    view = searchView
  }
  
  override func viewDidLoad() {
    searchView.searchTableView.dataSource = self
    searchView.searchTableView.delegate = self
    setupBlurView()
    addKeyboardObservers()
    searchViewDismissButtonTapped()
    handleTextFieldUserInput()
  }
}

// MARK: - tableView delegate methods
extension SearchViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let selectedCellLongitude = searchViewModel.locations?.geonames[indexPath.row].longitude else { return }
    guard let selectedCellLatitude = searchViewModel.locations?.geonames[indexPath.row].latitude else { return }
    // get city weather data based on selected row
    searchViewModel.getCityWeatherData(long: selectedCellLongitude, lat: selectedCellLatitude)
    // geoReverse to get city name
    searchViewModel.geoReverse(long: selectedCellLongitude, lat: selectedCellLatitude)
    // handler is called when searchViewModel city property is set
    searchViewModel.searchActionHandler = { [weak self] in
      self?.delegate?.city = self?.searchViewModel.city
      self?.dismiss(animated: true, completion: nil)
    }
  }
}

// MARK: - tableView data source methods
extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let locationsCount = searchViewModel.locations?.geonames.count else { return 0 }
    return locationsCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchTableViewCell
    let array = searchViewModel.locations?.geonames[indexPath.row].name
    let firstLetter = array.map { $0.prefix(1) }
    if let safeFirstLetter = firstLetter {
      cell.locationFirstLetterLabel.text = "\(safeFirstLetter)"
    }
    if let locationName = searchViewModel.locations?.geonames[indexPath.row].name,
      let locationCountry = searchViewModel.locations?.geonames[indexPath.row].countryCode {
      cell.locationNameLabel.text = "\(locationName), \(locationCountry)"
    }
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
      self?.searchViewModel.getLocationsByName(input: output)
      self?.searchView.activityIndicatorView.startAnimating()
    }
    
    searchViewModel.searchActionHandler = { [weak self] in
      self?.searchView.searchTableView.reloadData()
      self?.searchView.activityIndicatorView.stopAnimating()
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
