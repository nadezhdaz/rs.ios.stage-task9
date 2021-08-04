//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        
        //let tabbarVC = RSTabBarViewController()
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = RSTabBarViewController()
        self.window?.makeKeyAndVisible()
        
        //UITabBar.appearance().barTintColor = UIColor.white
        //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 60.0/255, green: 60.0/255, blue: 67.0/255, alpha: 0.6)], for: .normal)
        //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 255.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0)], for: .selected)
        //UITabBar.appearance.set //setUnselectedItemTintColor:[UIColor blackColor;
    }
}

