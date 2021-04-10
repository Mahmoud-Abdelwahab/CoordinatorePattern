//
//  MainTabBarVC.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class MainTabBarVC: UITabBarController , Storyboarded {
    
    weak var mainTabBarVCCoordinatore: MainTabBarVCCoordinatore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.orange
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
        
    }
    
}
