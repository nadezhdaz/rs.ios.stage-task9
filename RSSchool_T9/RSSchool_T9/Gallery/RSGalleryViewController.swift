//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var galleryImages: [UIImage] = []
    var gallery: Gallery!
    
    /*let closeButton: RSCloseButton = {
        let button = RSCloseButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()*/
    
    private let galleryCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .black        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        galleryCollectionView.resizeScrollViewContentSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCellId", for: indexPath) as! RSGalleryCollectionViewCell
        let image = galleryImages[indexPath.row]
        
        cell.setupGalleryImage(from: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = galleryCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderGalleryCellId", for: indexPath) as! RSGalleryCollectionReusableView
        
        view.setupGalleryHeader(gallery)
        view.headerView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = galleryImages[indexPath.row]
        let zoomingVC = RSZoomingViewController(image: image)
        zoomingVC.modalPresentationStyle = .fullScreen
        present(zoomingVC, animated: true, completion: nil)
        
        
        galleryCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.bounds.width
        let height = width * 1.786
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthInsets: CGFloat = 20 * 2
        let minimumItemSpacing: CGFloat = 20
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width - widthInsets - minimumItemSpacing * 3
        return CGSize(width: width, height: width * 1.3663)
    }
    
    func setupCollectionView() {
        view.addSubview(galleryCollectionView)
        //view.addSubview(closeButton)
        
            NSLayoutConstraint.activate([
                galleryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),// constant: 30.0),//70.0),
                galleryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),//, constant: -50.0),
                galleryCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20.0),
                galleryCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0)
            ])
        
        galleryCollectionView.register(RSGalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCellId")
        galleryCollectionView.register(RSGalleryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderGalleryCellId")
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
    }
    
    public func setupGallery(_ gallery: Gallery) {
        self.galleryImages = gallery.images
        self.gallery = gallery
        galleryCollectionView.reloadData()
        view.layoutIfNeeded()
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        galleryCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    
    /*override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass || self.traitCollection.horizontalSizeClass != previousTraitCollection!.horizontalSizeClass {
            updateViewConstraints()
            
            galleryCollectionView.updateConstraints()
        }
    }*/
    
}
