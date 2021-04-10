//
//  BuyCordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class BuyCordinatore: Coordinator{
   weak var parentCoordinator: HomeCoordinatore?
    
    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    var selectedDate: String?
    
    init( navigationController: UINavigationController,selectedDate: String) {
        self.navigationController = navigationController
        self.selectedDate = selectedDate
    }
    
    func start() {
        let buyVC = BuyVC.instantiante(storyboardName: "Main")
        buyVC.buyCoordinator = self
        buyVC.selectedDate = selectedDate
        self.navigationController.pushViewController(buyVC, animated: true)
    }
    
    
    
}

