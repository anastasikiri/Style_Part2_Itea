//
//  UIFont+Extension.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-21.
//

import Foundation
import UIKit

extension UIFont {
    class func sansProBlack(ofSize size: CGFloat) -> UIFont {
        return UIFont(name:"SourceSansPro-Black", size: size)!
    }
    
    class func allLabelFonts() -> UIFont {
        UIFont(name: "SourceSansPro-Black", size: 16)!
    }
}
