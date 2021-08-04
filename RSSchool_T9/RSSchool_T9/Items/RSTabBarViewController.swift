//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSTabBarViewController: UITabBarController, RSSettingsViewControllerDelegate {//}, UITabBarControllerDelegate {
    
    //let tabBarVC = UITabBarController()
    
    let drawingSettings = DrawingSettingsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
        //setupSwipes()
        //self.delegate = self
    }
    
    func createTabBarController() {        
        let itemsVc = RSItemsViewController()
        //itemsVc.title = "Items"
        //itemsVc.view.backgroundColor = UIColor.white
        itemsVc.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        
        let settingsVc = RSSettingsViewController()
        settingsVc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        settingsVc.delegate = self
        let controllerArray = [itemsVc, settingsVc]
        viewControllers = controllerArray.map{ UINavigationController(rootViewController: $0) }
        
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.red
           
        //self.view.addSubview(tabBarVC.view)
    }
    
    func setDrawingEnabled(_ enabled: Bool) {
        //DrawingSettingsModel.currentDrawingEnabled(enabled)
        DrawingSettingsModel.isDrawingEnabled = enabled
    }
    
    func setDrawingColor(_ color: String) {
        DrawingSettingsModel.strokeColor = UIColor.initWithHexString(color)
    }
    
    /*func setupSwipes() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeRight.direction = .right
        tabBarVC.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeLeft.direction = .left
        tabBarVC.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
                if (tabBarVC.selectedIndex) == 0 {
                    tabBarVC.selectedIndex = 1
                }
            } else if gesture.direction == .right {
                if (tabBarVC.selectedIndex) == 1 {
                    tabBarVC.selectedIndex = 0
                }
            }
    }*/

}
