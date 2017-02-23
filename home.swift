//
//  home.swift
//  photosApp
//
//  Created by vyshnavi k on 18/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit

class homeView: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = UIColor.white
        let tabOne = photosTab()
        let tabOneBarItem = UITabBarItem(title: " photos", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = UploadTab()
        let tabTwoBarItem2 = UITabBarItem(title: "upload", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
    
    }
