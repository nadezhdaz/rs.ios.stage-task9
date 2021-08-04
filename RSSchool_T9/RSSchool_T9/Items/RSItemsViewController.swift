//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

private enum ItemsLayoutConstant {
    static let spacing: CGFloat = 16.0
    static let itemHeight: CGFloat = 220.0
    static let numberOfColumns: CGFloat = 2.0
    static let preserved: CGFloat = 40.0
}

class RSItemsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var storyViewController = RSStoryViewController()
    var galleryViewController = RSGalleryViewController()
    
    private let itemsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let numberOfColumns = 2
    let data = FillingData.data

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Items"
        view.backgroundColor = UIColor.white
        setupCollectionView()
        itemsCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        view.addSubview(itemsCollectionView)
        itemsCollectionView.translatesAutoresizingMaskIntoConstraints = false

            // Layout constraints for `collectionView`
            NSLayoutConstraint.activate([
                itemsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),//, constant: 40.0),
                itemsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),//, constant: -50.0),
                itemsCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20.0),
                itemsCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0)
            ])
        
        self.itemsCollectionView.register(RSItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCellId")
        self.itemsCollectionView.delegate = self
        self.itemsCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellId", for: indexPath) as! RSItemCollectionViewCell
        
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = data[indexPath.row]
        switch type {
        case .story(let story):
            openStoryViewController(with: story)
        case .gallery(let gallery):
            openGalleryViewController(with: gallery)
        }
        itemsCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let content = data[indexPath.row]
        var image: UIImage
        switch content {
        case .gallery(let gallery):
            image = gallery.coverImage
        case .story(let story):
            image = story.coverImage
        }
        
        //let width = (view.bounds.size.width - ItemsLayoutConstant.preserved) / ItemsLayoutConstant.numberOfColumns
        let width = itemsCollectionView.bounds.size.width / ItemsLayoutConstant.numberOfColumns - 16.0// + 8.0
        //let height = image.size.height * width / image.size.width
        let height = (image.size.height) * width / (image.size.height) //+ 10.0
        return CGSize(width: width, height: ItemsLayoutConstant.itemHeight)
        //let width = (view.bounds.size.width - ItemsLayoutConstant.preserved) / ItemsLayoutConstant.numberOfColumns
        //let width = itemWidth(for: itemsCollectionView.frame.width, spacing: 0)
        //let height = width *

        //return CGSize(width: width, height: ItemsLayoutConstant.itemHeight)
        
        }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let columnsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (columnsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / columnsInRow

        return finalWidth// - 5.0
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard previousTraitCollection != nil else { return }
        itemsCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func openStoryViewController(with story: Story) {
        //if (self.storyViewController == nil) {
        //    self.storyViewController = RSStoryViewController();
            //self.storyViewController.delegate = self;
            
        //}
        addChild(storyViewController)
        storyViewController.setupStory(story)
        view.addSubview(storyViewController.view)
        storyViewController.view.frame = UIScreen.main.bounds
        storyViewController.didMove(toParent: self)
        //view.window?.rootViewController?.present(storyViewController, animated: true, completion: nil)
    }
    
    func openGalleryViewController(with gallery: Gallery) {
        
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: ItemsLayoutConstant.spacing, left: ItemsLayoutConstant.spacing, bottom: ItemsLayoutConstant.spacing, right: ItemsLayoutConstant.spacing)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return ItemsLayoutConstant.spacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return ItemsLayoutConstant.spacing
        }*/

}
