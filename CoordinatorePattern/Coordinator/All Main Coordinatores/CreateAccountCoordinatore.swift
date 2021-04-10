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
    
    func childDidFilish(_ child: Coordinator?){
        for (index , coordinatore) in childCoordinators.enumerated(){
            if coordinatore === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func dismiss(animated: Bool){
        navigationController.popViewController(animated: animated)
        navigationController.dismiss(animated: animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else{
            return
        }
        // check if navigationController array contains this vc if it exists then this means you can't push it another time
        // if navigationConroller array dos'nt contains VC this mean it poped so we have to pop it also from cildcoordinatores array as below
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
            
        // removing VC from child Coordinator array
        if let buyVC =  fromViewController as? BuyVC {
            childDidFilish(buyVC.buyCoordinator)
        }
        
        if let createAccountVC =  fromViewController as? CreateAccountVC {
            childDidFilish(createAccountVC.createAccountCoordinator)
        }
        
        if let moreDetailsVC =  fromViewController as? MoreDetailsVC {
            childDidFilish(moreDetailsVC.moreDetailsCoordinatore)
        }

    }
    
}
