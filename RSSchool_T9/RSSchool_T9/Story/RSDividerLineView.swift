//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDividerLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0

        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
