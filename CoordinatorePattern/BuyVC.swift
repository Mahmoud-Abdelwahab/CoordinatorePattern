//
//  BuyVC.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit

class BuyVC: UIViewController, Storyboarded{
      var buyCoordinator: BuyCordinatore?

    var selectedDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedDate
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapShowMoreDetails(_ sender: Any) {
        buyCoordinator?.navigateToMoreDetailsVC()
    }
  

}
