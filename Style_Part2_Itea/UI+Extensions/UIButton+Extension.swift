//
//  UIButton+Extension.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-27.
//

import Foundation
import UIKit

extension UIButton {
    class func configureButton(title: String,
                               font: UIFont,
                               titleColor: UIColor,
                               bgColor: UIColor,
                               sizeFrame: CGRect,
                               withRadius: CGFloat) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.backgroundColor = bgColor
            button.frame = sizeFrame
            button.titleLabel?.font = font
            button.setTitleColor(titleColor, for: .normal)
            button.layer.cornerRadius = withRadius
        return button
    }
}
