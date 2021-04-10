//
//  Storyboarded.swift
//  CoordinatorePattern
//
//  Created by Mahmoud Abdul-Wahab on 07/04/2021.
//

import UIKit

protocol Storyboarded {
    static func instantiante(storyboardName: String) -> Self
}

extension Storyboarded where Self: UIViewController{
    static func instantiante(storyboardName: String) -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
