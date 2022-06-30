//
//
//  Created by Anastasia Bilous on 2022-06-24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    public let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(textLabel)
        textLabel.frame = bounds
    }
    
    public func configure(with text: String, font: UIFont) {
        textLabel.text = text
        textLabel.font = font
        
        if UserDefaults.standard.integer(forKey: "themeKey") == 0 {
            textLabel.textColor = .black
        } else {
            textLabel.textColor = .white
        }
    }
}
