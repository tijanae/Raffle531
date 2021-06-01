//
//  ViewController.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class TabBar: UITabBarController{

    let firstvc = RaffleHomeVC()
    let secondvc = WatchListVC()
    let thirdvc = RaffleHomeVC()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstvc.tabBarItem = UITabBarItem(title: "All Raffles", image: UIImage(systemName: "circle.grid.cross.up.fill"), tag: 0)
        secondvc.tabBarItem = UITabBarItem(title: "Watch List", image: UIImage(systemName: "heart.fill"), tag: 1)
        thirdvc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        viewControllers = [firstvc, secondvc]
        viewControllers?.forEach({$0.tabBarController?.tabBar.barStyle = .default})
    }


}

