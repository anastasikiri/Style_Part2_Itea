//
//
//  Created by Anastasia Bilous on 2022-06-24.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PictureCollectionViewCell"
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)        
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with image: UIImage, radius: CGFloat) {
        imageView.image = image
        imageView.layer.cornerRadius = radius
    }
}
