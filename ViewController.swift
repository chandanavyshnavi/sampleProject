//
//  ViewController.swift
//  photosApp
//
//  Created by vyshnavi k on 17/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var welcomeImage = UIImageView()
        welcomeImage.frame = CGRect(x: 0, y: 30, width: self.view.frame.size.width, height: self.view.frame.size.height )
        welcomeImage.backgroundColor = UIColor.darkGray
        welcomeImage.image = UIImage(named: "pic.jpg")
        self.view.addSubview(welcomeImage)
        
        let welcomeLabel = UILabel()
        welcomeLabel.frame = CGRect(x: 110, y: self.view.frame.size.height - 400, width: 150, height: 100)
        welcomeLabel.text = "MYPHOTOAPP"
        welcomeLabel.textAlignment = .justified
        welcomeLabel.textColor = UIColor.black
        self.view.addSubview(welcomeLabel)
        
        
        let recognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(recognizer:)))
        recognizer.direction = .left
        self.view.addGestureRecognizer(recognizer)
        
    }
    
    func swipeLeft(recognizer: UISwipeGestureRecognizer){
        self.performSegue(withIdentifier: "loginidentifier", sender: self)
        print("left slider")
        let vc = loginPage()
        // Alternative way to present the new view controller
        self.navigationController?.pushViewController(vc, animated: false)
        
        
    }
    
}
