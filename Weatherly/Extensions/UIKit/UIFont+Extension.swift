//
//  UIFont+Extension.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 23/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import UIKit

// MARK: - get the Gotham font, with desired size and weight (based on Gotham font family)
extension UIFont {
  enum GothamRoundedWeight: String {
    case light = "GothamRounded-Light"
    case book = "GothamRounded-Book"
  }
  
  static func getGothamFont(size: CGFloat, weight: GothamRoundedWeight) -> UIFont {
    return UIFont(name: weight.rawValue, size: size) ?? .systemFont(ofSize: size)
  }
}
