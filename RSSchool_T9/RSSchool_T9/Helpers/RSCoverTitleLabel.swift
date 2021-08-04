//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSCoverTitleLabel: UILabel {

    let topInset = CGFloat(5)
    let bottomInset = CGFloat(5)
    let leftInset = CGFloat(5)
    let rightInset = CGFloat(5)
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override public var intrinsicContentSize: CGSize {
            var intrinsicSuperViewContentSize = super.intrinsicContentSize
            intrinsicSuperViewContentSize.height += topInset + bottomInset
            intrinsicSuperViewContentSize.width += leftInset + rightInset
            return intrinsicSuperViewContentSize
        }
}
