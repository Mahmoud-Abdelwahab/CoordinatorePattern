//
//  HomeCoordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit

class HomeCoordinatore: NSObject, Coordinator, UINavigationControllerDelegate{
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self // to trake which VC is showing now
        let homeVC = HomeVC.instantiante(storyboardName: "Main")
        homeVC.homeCoordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func navigateToCreateAccountVC(){
        let createAccountCoordinatore = CreateAccountCoordinatore(navigationController: self.navigationController)
        childCoordinators.append(createAccountCoordinatore)
        createAccountCoordinatore.parentCoordinator = self
        createAccountCoordinatore.start()
    }
    
    func navigateToBuyVC(selectedDate: String){
        let buyCoordinatore = BuyCordinatore(navigationController: self.navigationController,selectedDate: selectedDate)
        childCoordinators.append(buyCoordinatore)
      //  buyCoordinatore.parentCoordinator = self
        buyCoordinatore.start()
    }
    
//    func navigateToMoreDetailsVC(){
//        let moreDetailsCoordinatore = MoreDetailsCoordinatore(navigationController: self.navigationController)
//        childCoordinators.append(moreDetailsCoordinatore)
//        moreDetailsCoordinatore.parentCoordinator = self
//        moreDetailsCoordinatore.start()
//    }
//    

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
