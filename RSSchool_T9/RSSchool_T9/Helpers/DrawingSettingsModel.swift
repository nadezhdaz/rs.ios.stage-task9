//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DrawingSettingsModel {
    static var isDrawingEnabled = true
    static var strokeColor: UIColor = UIColor.initWithHexString("#f3af22")
    
    func currentDrawingEnabled() -> Bool {
        return DrawingSettingsModel.isDrawingEnabled
    }
    
    func currentDrawingColor() -> UIColor {
        return DrawingSettingsModel.strokeColor
    }
}
