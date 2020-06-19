//
//  UIView+Extension.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 18/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
    layer.insertSublayer(gradientLayer, at: 0)
  }
}

class GradientView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
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
