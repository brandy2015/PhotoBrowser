//
//  JXImageCell.swift
//  JXMediaBrowser
//
//  Created by Jason on 2021/5/14.
//

import UIKit

open class JXImageCell: UICollectionViewCell {
    
    public var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView.frame = self.contentView.bounds
        self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(self.imageView)
        
        self.contentView.backgroundColor = UIColor.red
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    open func reload(with image: UIImage?) {
        self.imageView.image = image
    }
    
}
