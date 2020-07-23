//
//  NSLayoutConstraint+Extension.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 24/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

// MARK: - activate constraints and set translatesAutoresizingMaskIntoConstraints to true with each new UIView
extension NSLayoutConstraint {
  public class func useAndActivateConstraints(constraints: [NSLayoutConstraint]) {
    for constraint in constraints {
      if let view = constraint.firstItem as? UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
      }
    }
    activate(constraints)
  }
}
