//
//  CreateAccountCoordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class CreateAccountCoordinatore: Coordinator{
    weak var parentCoordinator: HomeCoordinatore?

    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController =  navigationController
    }
    
    func start() {
        let createAccountVC = CreateAccountVC.instantiante(storyboardName: "Main")
        createAccountVC.createAccountCoordinator = self
        self.navigationController.pushViewController(createAccountVC, animated: true)
    }
    
    
}
