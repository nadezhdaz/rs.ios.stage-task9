//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemCollectionViewCell: UICollectionViewCell {
    
    var innerView: UIView = {
        let subView = UIView()
        subView.layer.cornerRadius = 9.0
        subView.layer.borderWidth = 1.0
        subView.layer.borderColor = UIColor.black.cgColor
        subView.clipsToBounds = true
        return subView
    }()
    
    var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Rockwell-Regular", size: 16)
        label.textColor = UIColor.white
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Rockwell-Regular", size: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.7, 1.0]
        return gradient
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = innerView.bounds
        innerView.layer.addSublayer(gradientLayer)
    }
    
    func configure(with contentType: ContentType) {
        switch contentType {
        case .story(let story):
            coverImageView.image = story.coverImage
            titleLabel.text = story.title
            subtitleLabel.text = story.type
        case .gallery(let gallery):
            coverImageView.image = gallery.coverImage
            titleLabel.text = gallery.title
            subtitleLabel.text = gallery.type
        }
        //setNeedsLayout()
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 9.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
        
        
        addSubview(innerView)
        innerView.addSubview(coverImageView)
        innerView.addSubview(titleLabel)
        innerView.addSubview(subtitleLabel)
        
        gradientLayer.frame = innerView.bounds
        innerView.layer.addSublayer(gradientLayer)
        
        //gradientLayer.frame = coverImageView.bounds
        //coverImageView.layer.addSublayer(gradientLayer)
        
        innerView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            innerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0),
            innerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8.0)
        ])
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coverImageView.leftAnchor.constraint(equalTo: leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 151.0),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -3.0),
            titleLabel.leftAnchor.constraint(equalTo: innerView.leftAnchor, constant: 10.0),
            titleLabel.rightAnchor.constraint(equalTo: innerView.rightAnchor, constant: -15.0)
        ])
        
        NSLayoutConstraint.activate([
            //subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 173.0),
            subtitleLabel.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -30.0),
            subtitleLabel.leftAnchor.constraint(equalTo: innerView.leftAnchor, constant: 10.0),
            subtitleLabel.rightAnchor.constraint(equalTo: innerView.rightAnchor, constant: -13.0)
        ])
        
       // NSLayoutConstraint.activate([
       //     coverImageView.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
       //     coverImageView.centerYAnchor.constraint(equalTo: subView.centerYAnchor),
        //])
    }
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
