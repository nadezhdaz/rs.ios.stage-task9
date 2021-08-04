//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSCloseButton: UIButton {

    var xmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isHighlighted: Bool {
        didSet {
            xmarkImageView.tintColor = isHighlighted ? UIColor.darkGray : UIColor.white
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.point(inside: point, with: event) {
            self.isHighlighted = true
            return self
        }
        return super.hitTest(point, with: event)
    }
    
    func setupButton() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(xmarkImageView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            xmarkImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            xmarkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            xmarkImageView.heightAnchor.constraint(equalToConstant: 21),
            xmarkImageView.widthAnchor.constraint(equalToConstant: 19)
        ])
    }

}
