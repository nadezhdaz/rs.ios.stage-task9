//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDividerLineView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let lineWidth: CGFloat = 1.0
        context.setLineWidth(lineWidth)
        context.setStrokeColor(UIColor.white.cgColor)
        let startingPoint = CGPoint(x: 0, y: rect.size.height - lineWidth)
        let endingPoint = CGPoint(x: rect.size.width, y: rect.size.height - lineWidth)
        context.move(to: startingPoint )
        context.addLine(to: endingPoint )
        context.strokePath()
    }
    

}
