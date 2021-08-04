//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSAnimationCollectionViewCell: UICollectionViewCell {
    
    //var currentStep: CGFloat = 1.0/(60.0 * 3.0)
    var timer: Timer?
    //var clearLayer: (() -> Void)?
    
    var innerShapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        //shapeLayer.path = path
        //shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        //shapeLayer.frame = innerView.bounds
        ///shapeLayer.position = CGPoint(x: CGFloat(10.0), y: CGFloat(25.0))
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round;
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round;
        return shapeLayer
    }()
    
    var innerView: UIView = {
        let subview = UIView()
        subview.clipsToBounds = true
        subview.translatesAutoresizingMaskIntoConstraints = false
        return subview
    }()
    
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.black
        
        //layer.cornerRadius = 4.0
        //layer.borderWidth = 1.0
        //layer.borderColor = UIColor.white.cgColor
        
        addSubview(innerView)
        
        //layer.addSublayer(innerShapeLayer)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: topAnchor, constant: 12.5),// constant: 10.0),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor),// constant: -10.0),
            innerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12.5),
            innerView.rightAnchor.constraint(equalTo: rightAnchor)// constant: -10.0)
            //innerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            //innerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTimerAnimation(with path: CGPath, color: UIColor, shouldDraw: Bool) {
        //innerView.layer.removeAllAnimations()
        innerView.layer.sublayers?.removeLast()
        innerView.layer.sublayers = nil
        let currentStep: CGFloat = 1.0/(60.0 * 3.0)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "Shape"
        shapeLayer.path = path
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.frame = innerView.bounds
        //shapeLayer.position = CGPoint(x: CGFloat(10.0), y: CGFloat(25.0))
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round;
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round;
        
        let interval = 1.0 / 60.0
        //self.currentStep = 1.0/(60.0 * 3.0)
        if shouldDraw {
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { [weak self] _ in
                shapeLayer.strokeEnd += currentStep
                if shapeLayer.strokeEnd > 1.0 {
                    self?.timer?.invalidate()
                    self?.timer = nil
                    }
                })
        }
        
        //innerView.layer.addSublayer(shapeLayer)
        innerView.layer.addSublayer(shapeLayer)
    }
    
    public func setupCABasicAnimation(with path: CGPath, color: UIColor, shouldDraw: Bool) {
        innerView.layer.removeAllAnimations()
        innerView.layer.sublayers?.removeLast()
        innerView.layer.sublayers = nil
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "Shape"
        shapeLayer.path = path
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.frame = innerView.bounds
        //shapeLayer.position = CGPoint(x: CGFloat(10.0), y: CGFloat(25.0))
        //shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round;
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round;
        
        let stroke = CABasicAnimation(keyPath: "strokeEnd")
        stroke.fromValue = 0;
        stroke.toValue = 1;
        //stroke.repeatCount = 1;
        if shouldDraw {
            stroke.duration = 3.0
        }
        stroke.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        stroke.fillMode = CAMediaTimingFillMode.forwards
        stroke.isRemovedOnCompletion = false
        shapeLayer.add(stroke, forKey: "stroke")
        
        
        innerView.layer.addSublayer(shapeLayer)
    }
    
    
    public func clearAnimation() {
        innerView.layer.removeAllAnimations()
        innerView.layer.sublayers?.first!.removeFromSuperlayer()
    }
    
}
