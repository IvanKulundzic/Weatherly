//
//  CustomTextField.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 19/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
  private lazy var searchButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupOverlayButton()
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    let bounds = bounds.insetBy(dx: 15, dy: 0)
    return bounds
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let bounds = bounds.insetBy(dx: 15, dy: 0)
    return bounds
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let bounds = bounds.insetBy(dx: 15, dy: 0)
    return bounds
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

// MARK: - add search button
private extension CustomTextField {
  func setupOverlayButton() {
    searchButton.setImage(UIImage(named: "search_icon"), for: .normal)
    searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    searchButton.contentEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
    
    self.rightView = searchButton
    self.rightViewMode = .always
  }
  
  @objc func searchButtonTapped() {
    print("Search button tapped")
  }
}
