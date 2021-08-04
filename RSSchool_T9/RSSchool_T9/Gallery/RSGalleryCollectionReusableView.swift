//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryCollectionReusableView: UICollectionReusableView {
    var headerView: RSHeaderView = {
        let header = RSHeaderView()
        header.backgroundColor = .clear
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerView)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    public func setupGalleryHeader(_ gallery: Gallery) {
        headerView.headerImageView.image = gallery.coverImage
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        headerView.titleLabel.attributedText = NSMutableAttributedString(string: gallery.title.trimmingCharacters(in: .newlines), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        headerView.titleLabel.sizeToFit()
        headerView.typeLabel.text = gallery.type
        headerView.typeLabel.sizeToFit()
        layoutIfNeeded()
    }
}
