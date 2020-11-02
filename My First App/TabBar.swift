//
//  TabBar.swift
//  My First App
//
//  Created by Valery Frenkel on 11/2/20.
//

import UIKit

class TabBar: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarViewController = UITabBarController()
        
        let newsViewController = NewsViewController()
        
        newsViewController.title = "News"
        newsViewController.tabBarItem = UITabBarItem.init(title: "News", image: UIImage(named: "news"), tag: 1)
        
        let casesViewController = CasesViewController()
        
        casesViewController.title = "Cases"
        casesViewController.tabBarItem = UITabBarItem.init(title: "Cases", image: UIImage(named: "cases"), tag: 1)
        
        let profileViewController = ProfileViewController()
        
        profileViewController.title = "Profile"
        profileViewController.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(named: "profile"), tag: 1)
        
        let navigationViewController = UINavigationController(rootViewController: newsViewController)
        let navigationViewController2 = UINavigationController(rootViewController: casesViewController)
        let navigationViewController3 = UINavigationController(rootViewController: profileViewController)
        
        let viewControllers = [navigationViewController, navigationViewController2, navigationViewController3]
        
        tabBarViewController.setViewControllers(viewControllers, animated: false)
 }
    
    
}