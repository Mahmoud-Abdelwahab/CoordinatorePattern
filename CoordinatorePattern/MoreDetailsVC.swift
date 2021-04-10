//
//  MoreDetailsVC.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 10/04/2021.
//

import UIKit

class MoreDetailsVC: UIViewController, Storyboarded {

    weak var moreDetailsCoordinatore: MoreDetailsCoordinatore?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissDidTapped(_ sender: Any) {
        moreDetailsCoordinatore?.parentCoordinator?.dismiss(animated: true)
    }
    
}
