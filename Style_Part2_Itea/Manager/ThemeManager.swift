//
//  ThemeManager.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-26.
//

import Foundation
import UIKit

enum ThemeColors: Int {
    case white
    case black
    case red
}

final class ThemeManager {
    static let shared = ThemeManager()
    
    private let themeKey = "themeKey"
    
    private init() {}
    
    var currentTheme: ThemeColors {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: themeKey)
        }
        get {
            ThemeColors(rawValue: UserDefaults.standard.integer(forKey: themeKey)) ?? .red
        }
    }
}


