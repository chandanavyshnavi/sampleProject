//
//  loginPage.swift
//  photosApp
//
//  Created by vyshnavi k on 17/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit
class loginPage: UIViewController {
    var username = UITextField()
    var password = UITextField()
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        username.frame = CGRect(x: 10, y: 70, width: self.view.frame.size.width, height: 50)
        username.placeholder = "enter login id"
        username.keyboardType = .default
        username.backgroundColor = UIColor.gray
        self.view.addSubview(username)
        
        password.frame  = CGRect(x: 10, y: 140, width: self.view.frame.width, height: 50)
        password.placeholder = "ener password"
        password.keyboardType = .default
        password.backgroundColor = UIColor.gray
        self.view.addSubview(password)
        
        var login = UIButton()
        login.frame = CGRect(x: 10, y: 220, width: Int(self.view.frame.width), height: 50)
        login.backgroundColor = UIColor.red
        login.setTitle("login", for: .normal)
        login.addTarget(self, action: #selector(self.login(btn:)), for: .touchUpInside)
        self.view.addSubview(login)
        
        
            }
    func login(btn:UIButton){
        
        if username.text == "" || password.text == "" {
            
            let alertController = UIAlertController(title: "enter login details", message:
                "to login", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
     let vc1 = homePage()
        self.navigationController?.pushViewController(vc1, animated: false)
        
        }
}

}







