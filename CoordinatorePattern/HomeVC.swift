//
//  HomeVC.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit

class HomeVC: UIViewController, Storyboarded{
    weak var homeCoordinator: HomeCoordinatore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapBuyBtn(_ sender: Any) {
        homeCoordinator?.navigateToBuyVC(selectedDate: "04/12/2021")
    }
    
    @IBAction func didTapCreateAccountBtn(_ sender: Any) {
        homeCoordinator?.navigateToCreateAccountVC()
    }
    
}

