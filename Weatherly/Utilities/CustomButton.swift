//
//  CustomButton.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 19/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

//
//  ActionButton.swift
//  LiveMPro
//
//  Created by Domagoj Kulundzic on 19/06/2020.
//  Copyright © 2020 3Embed. All rights reserved.
//

//import UIKit
//
//class ActionButton: UIButton {
//  enum Style {
//    case `default`
//    case destructive
//    case disabled
//    
//    var titleColor: UIColor {
//      switch self {
//      case .default:
//        return UIColor(hexString: "#F6F7F8")
//      case .destructive:
//        return UIColor(hexString: "#222E54")
//      case .disabled:
//        return UIColor(hexString: "#D3D5DD")
//      }
//    }
//    var backgroundColor: UIColor {
//      switch self {
//      case .default:
//        return UIColor(hexString: "#F6323E")
//      case .destructive, .disabled:
//        return .clear
//      }
//    }
//    var borderColor: UIColor {
//      switch self {
//      case .default:
//        return .clear
//      case .destructive, .disabled:
//        return UIColor(hexString: "#8A93AD")
//      }
//    }
//    var borderWidth: CGFloat {
//      switch self {
//      case .default:
//        return 0
//      case .destructive, .disabled:
//        return 1
//      }
//    }
//  }
//  var style = Style.default {
//    didSet { updateStyle(style) }
//  }
//  var height: CGFloat = 56 {
//    didSet { invalidateIntrinsicContentSize() }
//  }
//  override var intrinsicContentSize: CGSize {
//    return CGSize(width: super.intrinsicContentSize.width, height: height)
//  }
//  override var bounds: CGRect {
//    didSet { dropShadow() }
//  }
//  override var frame: CGRect {
//    didSet { dropShadow() }
//  }
//  private var didSetFont = false
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setupViews()
//  }
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//  override func willMove(toSuperview newSuperview: UIView?) {
//    super.willMove(toSuperview: newSuperview)
//    updateFontIfNeeded()
//  }
//}
//// MARK: - Private Methods
//private extension ActionButton {
//  func setupViews() {
//    setupView()
//    updateStyle(style)
//  }
//  func setupView() {
//    backgroundColor = UIColor(hexString: "#F6323E")
//    layer.cornerRadius = 28
//  }
//  func updateStyle(_ style: Style) {
//    backgroundColor = style.backgroundColor
//    setTitleColor(style.titleColor, for: .normal)
//    setTitleColor(style.titleColor, for: .disabled)
//    layer.borderWidth = style.borderWidth
//    layer.borderColor = style.borderColor.cgColor
//  }
//  func updateFontIfNeeded() {
//    if !didSetFont {
//      didSetFont = true
//      titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
//    }
//  }
//}
