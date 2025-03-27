//
//  TabBarViewController.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import UIKit

class TabBarViewController: UITabBarController {
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame = CGRect(x: 0, y: view.frame.maxY - 75, width: tabBar.frame.size.width , height: 75)
        
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tabBar.backgroundColor = UIColor.white
    }
    
    func setupTabBar(){
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .blue
        tabBarController?.tabBar.tintColor = .blue
  
        // Instantiate view controllers, tabbar items
        // MARK: - firstStoryBoard
        let firstStoryBoard = UIStoryboard(name: "AllAirlines", bundle: nil)
        let firstViewController = firstStoryBoard.instantiateViewController(withIdentifier: "AllAirlinesViewController") as! AllAirlinesViewController
        firstViewController.viewModel = AllAirlinesViewModel()
        let navFirst = UINavigationController(rootViewController: firstViewController)
        
        let firstSelected = UIImage.airlinetabarSelected.withRenderingMode(.alwaysOriginal)
        let firstUnSelected = UIImage.airlinetabbar.withRenderingMode(.alwaysOriginal)
        firstViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("", comment: ""), image: firstUnSelected, selectedImage: firstSelected) //All Airline
        
        // MARK: - secondStoryBoard
        let secondStoryBoard = UIStoryboard(name: "AllAirlines", bundle: nil)
        let secondViewController = secondStoryBoard.instantiateViewController(withIdentifier: "AllAirlinesViewController") as! AllAirlinesViewController
        secondViewController.viewModel = FavAirlinesViewModel()
        let navSecond = UINavigationController(rootViewController: secondViewController)
         
        let secondSelected = UIImage.favouriteTabbarSelected.withRenderingMode(.alwaysOriginal)
        let secondUnSelected = UIImage.favouritetabbr.withRenderingMode(.alwaysOriginal)
        secondViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("", comment: ""), image: secondUnSelected, selectedImage: secondSelected)
         
        // Assign viewControllers to tabBarController
        let viewControllers = [navFirst, navSecond]
        self.setViewControllers(viewControllers, animated: false)
    }
}

