//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryViewController: UIViewController {
    
    var storyInitial: Story?
    
    var innerView: UIView = {
        let subView = UIView()
        subView.backgroundColor = UIColor.clear
        //subView.layer.cornerRadius = 9.0
        //subView.layer.borderWidth = 1.0
        //subView.layer.borderColor = UIColor.black.cgColor
        //subView.clipsToBounds = true
        subView.translatesAutoresizingMaskIntoConstraints = false
        return subView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var headerView: RSHeaderView = {
        let header = RSHeaderView()
        header.backgroundColor = .clear
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var textView: UITextView = {
        let text = UITextView()
        text.textAlignment = .left
        text.font = UIFont(name: "Rockwell-Regular", size: 24)
        text.textColor = UIColor.white
        text.backgroundColor = UIColor.clear
        text.layer.cornerRadius = 4.0
        text.layer.borderWidth = 1.0
        text.layer.borderColor = UIColor.white.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.clipsToBounds = true
        return text
    }()
    
    var dividerView: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        tabBarController?.tabBar.isHidden = true
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(innerView)
        //view.addSubview(scrollView)
        innerView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(textView)
        //contentView.addSubview(dividerView)
        
        textView.isScrollEnabled = false
        
        let scrollContentHeight = headerView.bounds.height + textView.bounds.height
        let scrollContentWidth = view.bounds.width - 2 * 20.0
        //scrollView.contentSize = CGSize(width: scrollContentWidth, height: scrollContentHeight)
        let size = contentView.bounds.size
        contentView.center = scrollView.center
        scrollView.contentSize = size
        
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0),
            innerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30.0),
            innerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            innerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: innerView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: innerView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: innerView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //contentView.leftAnchor.constraint(equalTo: view.leftAnchor),
            //contentView.rightAnchor.constraint(equalTo: view.rightAnchor)
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: innerView.widthAnchor),
            //contentView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor)
        ])
        
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            //headerView.bottomAnchor.constraint(equalTo: textView.topAnchor),
            headerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            //headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20.0),
            //headerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //dividerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            //dividerView.bottomAnchor.constraint(equalTo: textView.topAnchor),
            //dividerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        //let textViewHeightConstraint = textView.heightAnchor.constraint(equalToConstant: (textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))).height)//.constraint(equalTo: scrollView.bottomAnchor)
        //textViewHeightConstraint.priority = UILayoutPriority(rawValue: 1000)
        //textViewHeightConstraint.constant = (textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))).height
        //textViewHeightConstraint.isActive = true
        
        
        
        //let heightConstraint = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        //    heightConstraint.priority = UILayoutPriority(rawValue: 250)
         //   heightConstraint.isActive = true
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            heightConstraint.priority = UILayoutPriority(rawValue: 250)
            heightConstraint.isActive = true
        
        //let widthConstraint = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        //widthConstraint.priority = UILayoutPriority(rawValue: 250)
        //widthConstraint.isActive = true
        /*
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: textView.topAnchor),
            headerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //textView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            textView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            textView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        ])
        
        */
    }
    
    public func setupStory(_ story: Story) {
        headerView.headerImageView.image = story.coverImage
        headerView.titleLabel.text = story.title
        headerView.typeLabel.text = story.type
        textView.text = story.text
        view.layoutIfNeeded()
    }
    
    /*override init() {
        super.init()
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }*/
    
    func drawDividerView() {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: view.frame.height))
        path.addLine(to: CGPoint(x: view.frame.width, y: view.frame.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.systemRed.cgColor
        shapeLayer.lineWidth = 1.0

        dividerView.layer.addSublayer(shapeLayer)
        
    }
    
    
}
