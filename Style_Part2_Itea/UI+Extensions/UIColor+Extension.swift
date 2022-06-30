//
//  UIColor+Extension.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-26.
//

import Foundation
import UIKit

extension UIColor {

  class var choiceOfColor: UIColor {
    switch ThemeManager.shared.currentTheme {
      case .white:
        return .white
      case .black:
        return .black
      case .red:
        return .red
    }
  }
}
