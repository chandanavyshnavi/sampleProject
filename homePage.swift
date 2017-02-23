//
//  homepage.swift
//  photosApp
//
//  Created by vyshnavi k on 17/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit


class homePage: UITabBarController,UITabBarControllerDelegate {
    var views = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        //self.navigationController?.isNavigationBarHidden = true
        
        let leftbarbutton = UIBarButtonItem(title: "menu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(menu(btn:)))
        
        self.navigationItem.leftBarButtonItem = leftbarbutton
        
        let tabOne = photosTab1()
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

        
    
    func menu(btn:UIButton){
        
        
        views.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width/2, height: self.view.frame.size.height)
        views.backgroundColor = UIColor.green
        self.view.addSubview(views)
        
        let home = UIButton()
        home.frame = CGRect(x: 0, y: 70, width: self.view.frame.width/2
            , height: 30)
        home.setTitle("home", for: .normal)
        home.addTarget(self, action: #selector(home(btn:)), for: .touchUpInside)
        home.backgroundColor = UIColor.black
        
        view.addSubview(home)
       
        let map = UIButton()
        map.frame = CGRect(x: 0, y: 120, width: self.view.frame.width/2, height: 30)
        map.setTitle("mapview", for: .normal)
        map.addTarget(self, action: #selector(mapv(btn:)), for: .touchUpInside)
        map.backgroundColor = UIColor.black
        view.addSubview(map)
        
        let costcal = UIButton()
        costcal.frame = CGRect(x: 0, y: 170, width: self.view.frame.width/2, height: 30)
        costcal.setTitle("costcalculator", for: .normal)
        costcal.addTarget(self, action: #selector(costcalc(btn:)), for: .touchUpInside)
        costcal.backgroundColor = UIColor.black
        view.addSubview(costcal)
        
        
        let profile = UIButton()
        profile.frame = CGRect(x: 0, y: 220, width: self.view.frame.width/2, height: 30)
        profile.setTitle("profile", for: .normal)
        profile.addTarget(self, action: #selector(prof(btn:)), for: .touchUpInside)
        profile.backgroundColor = UIColor.black
        view.addSubview(profile)
        
        let logout = UIButton()
        logout.frame = CGRect(x: 0, y: 270, width: self.view.frame.width/2, height: 30)
        logout.setTitle("logout", for: .normal)
        logout.addTarget(self, action: #selector(logout(btn:)), for: .touchUpInside)
        logout.backgroundColor = UIColor.black
        view.addSubview(logout)
       
      }
    
    
func home(btn:UIButton){
        
        
    }
    func mapv(btn:UIButton){
        
        let vc3 = mapview()
        self.navigationController?.pushViewController(vc3, animated: false)
        
    }
    func costcalc(btn:UIButton){
        
        let vc4 = calculator()
        self.navigationController?.pushViewController(vc4, animated: false)
        
        
    }
    func prof(btn:UIButton){
        let vc5 = profile()
        self.navigationController?.pushViewController(vc5, animated: false)
        
        
        
    }
    func logout(btn:UIButton){
        
        let refreshAlert = UIAlertController(title: "logout", message: "exit", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let  vc6 = loginPage()
            self.navigationController?.pushViewController(vc6, animated: false)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    }
