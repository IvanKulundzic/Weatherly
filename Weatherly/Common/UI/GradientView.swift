//
//  GradientView.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 20/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

final class GradientView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

// MARK: - setup view and gradient
extension GradientView {
  func setupViewAndGradientLayer(colorOne: UIColor, colorTwo: UIColor) {
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    guard let theLayer = self.layer as? CAGradientLayer else {
      return;
    }
    theLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
    //theLayer.locations = [0.0, 0.4]
    //theLayer.frame = self.bounds
  }
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
}
