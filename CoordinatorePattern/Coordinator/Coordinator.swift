//
//  Coordinator.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit
//AnyObject to make coordinator class only can't be struct casue it's shared
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
