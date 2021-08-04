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
    
    let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Rockwell-Regular", size: 48)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        return label
    }()
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell-Regular", size: 24)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.layer.cornerRadius = 4.0
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.white.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    var dividerView: UIView = {
        let line = UIView()
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
        drawDividerLineShapeLayer()
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
        //addSubview(dividerView)
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -58.0),
            headerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            headerImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -55.0),
            titleLabel.leftAnchor.constraint(equalTo: headerImageView.leftAnchor, constant: 30.0),
            titleLabel.rightAnchor.constraint(equalTo: headerImageView.rightAnchor, constant: -30.0)
        ])
        
        NSLayoutConstraint.activate([
            typeLabel.centerYAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: headerImageView.centerXAnchor)
            //headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            //headerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            //headerImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //dividerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
    }
    
    func drawDividerLineShapeLayer() {
        let path = UIBezierPath()
        let startX = frame.width / 4
        let endX = frame.width - frame.width / 4
        path.move(to: CGPoint(x: startX, y: frame.height))
        path.addLine(to: CGPoint(x: endX, y: frame.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5.0

        layer.addSublayer(shapeLayer)
    }
    
}
