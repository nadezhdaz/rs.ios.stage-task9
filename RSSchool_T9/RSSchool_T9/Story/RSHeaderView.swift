//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSHeaderView: UIView {
    
    let closeButton: RSCloseButton = {
        let button = RSCloseButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: RSCoverTitleLabel = {
        let label = RSCoverTitleLabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Rockwell-Regular", size: 48)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    var typeLabel: RSTypeLabel = {
        let label = RSTypeLabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell-Regular", size: 24)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.layer.cornerRadius = 4.0
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.white.cgColor
        label.clipsToBounds = true
        //label.alignmentRectInsets
        return label
    }()
    
    var dividerView: RSDividerLineView = {
        let line = RSDividerLineView()
        return line
    }()
    
    var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.6, 1.0]
        return gradient
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = headerImageView.bounds
        headerImageView.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = headerImageView.bounds
        headerImageView.layer.addSublayer(gradientLayer)
        drawDividerLineShapeLayer()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(headerImageView)
        addSubview(titleLabel)
        addSubview(typeLabel)
        addSubview(closeButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor),            
            closeButton.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 70.0),
            headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -98.0),
            headerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            headerImageView.rightAnchor.constraint(equalTo: rightAnchor),
            headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor, multiplier: 500.0/374.0)
        ])
        
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: headerImageView.topAnchor, constant: 329.0),//headerImageView.bounds.height * 0.66),
            //titleLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -55.0),
            titleLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -34.0),
            titleLabel.leftAnchor.constraint(equalTo: headerImageView.leftAnchor, constant: 30.0),
            titleLabel.rightAnchor.constraint(equalTo: headerImageView.rightAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            typeLabel.centerYAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: headerImageView.centerXAnchor)
            //headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            //headerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            //headerImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        
    }
    
    func drawDividerLineShapeLayer() {
        let path = UIBezierPath()
        let lineLengthToFrameLength = 214.0 / 374.0
        let sideLength = (frame.width - frame.width * CGFloat(lineLengthToFrameLength)) /  CGFloat(2.0)
        let startX = sideLength
        let endX = frame.width  - startX
        let startY = frame.height - CGFloat(40)
        let endY = frame.height - CGFloat(40)
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: CGPoint(x: endX, y: endY))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0

        layer.addSublayer(shapeLayer)
    }
    
}
