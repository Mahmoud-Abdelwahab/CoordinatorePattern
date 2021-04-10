//
//  MainTabBarVCCoordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//


import UIKit

class MainTabBarVCCoordinatore{

    var childCoordinators =  [Coordinator]()
    
    var window: UIWindow?

    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let mainTabBarVC = MainTabBarVC()
        mainTabBarVC.mainTabBarVCCoordinatore = self
       
        //BuyVC
        let buyNav = UINavigationController()
        buyNav.tabBarItem = UITabBarItem(title: "Buy", image: UIImage(named: ""), tag: 0)
        let buyCoordinatore = BuyCordinatore(navigationController: buyNav, selectedDate: "hello")
        buyCoordinatore.start()
        
        //CreateAccoutVC
        let creatAccountNav = UINavigationController()
        creatAccountNav.tabBarItem = UITabBarItem(title: "Create Account", image: UIImage(named: ""), tag: 1)
        
        let createAccountCoordinator = CreateAccountCoordinatore(navigationController: creatAccountNav)
        createAccountCoordinator.start()
        
        mainTabBarVC.viewControllers = [buyNav,creatAccountNav]
        
        
        window?.rootViewController = mainTabBarVC
        window?.makeKeyAndVisible()
    }
    
    
    
    
}
