//
//  SceneDelegate.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    //var homeCoordinatore: HomeCoordinatore?
    var mainTabBar: MainTabBarVCCoordinatore?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        mainTabBar = MainTabBarVCCoordinatore(window: window!)
        mainTabBar?.start()
    }

  
}

