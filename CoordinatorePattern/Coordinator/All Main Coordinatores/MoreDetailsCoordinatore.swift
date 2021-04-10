//
//  MoreDetailsCoordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class MoreDetailsCoordinatore: Coordinator{
    weak var parentCoordinator: HomeCoordinatore?

    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController =  navigationController
    }
    
    func start() {
        let moreDetailsVC = MoreDetailsVC.instantiante(storyboardName: "Main")
        moreDetailsVC.moreDetailsCoordinatore = self
        self.navigationController.pushViewController(moreDetailsVC, animated: true)
    }

    func dismiss(animated: Bool , completion: (()->Void)?){
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
}
