//
//  Extensions.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 25/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

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
