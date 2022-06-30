//
//
//  Created by Anastasia Bilous on 2022-06-25.
//

import UIKit

class LabelPictureCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LabelPictureCollectionViewCell"
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let labelText: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(labelText)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelText.frame = CGRect(x: 15,
                                 y: contentView.frame.size.height - 45,
                                 width: contentView.frame.size.width - 15,
                                 height: 45)
        
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: contentView.frame.size.width,
                                 height: contentView.frame.size.height - 45)
    }
    
    public func configure(with image: UIImage, radius: CGFloat, title: String, font: UIFont) {
        imageView.image = image
        imageView.layer.cornerRadius = radius
        labelText.text = title
        labelText.font = font
        
        if UserDefaults.standard.integer(forKey: "themeKey") == 0 {
            labelText.textColor = .black
        } else {
            labelText.textColor = .white
        }
    }
}
