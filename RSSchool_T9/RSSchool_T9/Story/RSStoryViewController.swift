//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, RSSettingsViewControllerDelegate, RSColorSettingsViewControllerDelegate {
    
    var color = DrawingSettingsModel.strokeColor
    var shouldDraw = DrawingSettingsModel.isDrawingEnabled
    //var storyTabBarVC = RSTabBarViewController()
    
    var isDrawingEnabled = true
    var strokeColor: UIColor = UIColor.initWithHexString("#f3af22")
    var pathes: [CGPath] = []
    var clearLayer: (() -> Void)?
    
    let closeButton: RSCloseButton = {
        let button = RSCloseButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let graphicsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        viewLayout.itemSize = CGSize(width: 75, height: 75)
        viewLayout.minimumLineSpacing = 100
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .black
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
    
    var collectionContainerView: UIView = {
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
        header.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var textView: UITextView = {
        let text = UITextView()
        text.textAlignment = .left
        text.font = UIFont(name: "Rockwell-Regular", size: 24)
        text.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
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
        setupViews()
        
    }
    
    func setupViews() {
        view.addSubview(innerView)
        //view.addSubview(scrollView)
        innerView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(collectionContainerView)
        contentView.addSubview(textView)
        collectionContainerView.addSubview(graphicsCollectionView)
        
        graphicsCollectionView.reloadData()
        
        textView.isScrollEnabled = false
        
        //headerView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        //let scrollContentHeight = headerView.bounds.height + textView.bounds.height
        //let scrollContentWidth = view.bounds.width - 2 * 20.0
        //scrollView.contentSize = CGSize(width: scrollContentWidth, height: scrollContentHeight)
        //let size = contentView.bounds.size
        contentView.center = scrollView.center
        //scrollView.contentSize = size
        scrollView.resizeScrollViewContentSize()
        /*
        NSLayoutConstraint.activate([
           scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
           scrollView.frameLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
           scrollView.frameLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
           scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
           scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor),
           scrollView.contentLayoutGuide.leftAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leftAnchor),
           scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.rightAnchor)
        ])*/
        
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
            collectionContainerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionContainerView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -40.0),
            collectionContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionContainerView.heightAnchor.constraint(equalToConstant: 100.0)
        ])
        
        NSLayoutConstraint.activate([
            graphicsCollectionView.topAnchor.constraint(equalTo: collectionContainerView.topAnchor),
            graphicsCollectionView.bottomAnchor.constraint(equalTo: collectionContainerView.bottomAnchor),
            graphicsCollectionView.leftAnchor.constraint(equalTo: collectionContainerView.leftAnchor),
            graphicsCollectionView.rightAnchor.constraint(equalTo: collectionContainerView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //textView.topAnchor.constraint(equalTo: collectionContainerView.bottomAnchor),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            heightConstraint.priority = UILayoutPriority(rawValue: 250)
            heightConstraint.isActive = true
        
        graphicsCollectionView.register(RSAnimationCollectionViewCell.self, forCellWithReuseIdentifier: "AnimationCellId")
        graphicsCollectionView.delegate = self
        graphicsCollectionView.dataSource = self
    }
    
    public func setupStory(_ story: Story) {
        headerView.headerImageView.image = story.coverImage
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        headerView.titleLabel.attributedText = NSMutableAttributedString(string: story.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        headerView.typeLabel.text = story.type
        headerView.typeLabel.sizeToFit()
        textView.text = story.text
        pathes = story.paths
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pathes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = graphicsCollectionView.dequeueReusableCell(withReuseIdentifier: "AnimationCellId", for: indexPath) as! RSAnimationCollectionViewCell
        //clearLayer = cell.clearAnimation
        //clearLayer = cell.setupTimerAnimation(with: pathes[indexPath.row], color: color, shouldDraw: shouldDraw)
        cell.setupCABasicAnimation(with: pathes[indexPath.row], color: color, shouldDraw: shouldDraw)
        //cell.setupTimerAnimation(with: pathes[indexPath.row], color: color, shouldDraw: shouldDraw)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(100.0)
        return CGSize(width: width, height: graphicsCollectionView.bounds.size.height)
        
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100.0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,forItemAt indexPath: IndexPath) {
        let cellAnimated = cell as! RSAnimationCollectionViewCell
        cellAnimated.clearAnimation()
        cellAnimated.setupCABasicAnimation(with: pathes[indexPath.row], color: color, shouldDraw: shouldDraw)
        
    }
    
    func setDrawingEnabled(_ enabled: Bool) {
        isDrawingEnabled = enabled
    }
    
    func setDrawingColor(_ color: String) {
        strokeColor = UIColor.initWithHexString(color)
    }
    
    
    
}

extension UIScrollView {

    func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}
