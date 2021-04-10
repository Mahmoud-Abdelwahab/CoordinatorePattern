//
//  BuyCordinatore.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class BuyCordinatore: NSObject, Coordinator, UINavigationControllerDelegate{
    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    var selectedDate: String?
    
    init( navigationController: UINavigationController,selectedDate: String) {
        self.navigationController = navigationController
        self.selectedDate = selectedDate
    }
    
    func start() {
        #warning("Never forget nav delegate ")
        navigationController.delegate = self
        
        let buyVC = BuyVC.instantiante(storyboardName: "Main")
        buyVC.buyCoordinator = self
        buyVC.selectedDate = selectedDate
        self.navigationController.pushViewController(buyVC, animated: true)
    }
    
    func navigateToMoreDetailsVC(){
        let moreDetailsCoordinatore = MoreDetailsCoordinatore(navigationController: self.navigationController)
        childCoordinators.append(moreDetailsCoordinatore)
        moreDetailsCoordinatore.parentCoordinator = self
        moreDetailsCoordinatore.start()
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
      
        
        if let moreDetailsVC =  fromViewController as? MoreDetailsVC {
            childDidFilish(moreDetailsVC.moreDetailsCoordinatore)
        }
        
    }
    
    
}

