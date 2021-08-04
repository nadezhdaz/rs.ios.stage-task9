//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryCollectionViewCell: UICollectionViewCell {
    
    var innerView: UIView = {
        let subView = UIView()
        subView.layer.cornerRadius = 9.0
        subView.layer.borderWidth = 1.0
        subView.layer.borderColor = UIColor.black.cgColor
        subView.clipsToBounds = true
        subView.translatesAutoresizingMaskIntoConstraints = false
        return subView
    }()
    
    var galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.black
        layer.cornerRadius = 4.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        
        addSubview(innerView)
        innerView.addSubview(galleryImageView)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            innerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0),
            innerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0)
        ])
        
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: innerView.topAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            galleryImageView.leftAnchor.constraint(equalTo: innerView.leftAnchor),
            galleryImageView.rightAnchor.constraint(equalTo: innerView.rightAnchor),
            //galleryImageView.heightAnchor.constraint(equalTo: galleryImageView.widthAnchor, multiplier: 491.0/354.0)
        ])
        
        let heightConstraint = galleryImageView.heightAnchor.constraint(equalTo: galleryImageView.widthAnchor, multiplier: 491.0/354.0)
        heightConstraint.priority = UILayoutPriority(rawValue: 250)
        heightConstraint.isActive = true
        
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupGalleryImage(from image: UIImage) {
        galleryImageView.image = image
        layoutIfNeeded()
    }
    
}
