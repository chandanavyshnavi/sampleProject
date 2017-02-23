//
//  File.swift
//  photosApp
//
//  Created by vyshnavi k on 18/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit

class calculator: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let picker = UIImagePickerController()
    var images = UIImageView()
    var cost = Int()
    var imagesize = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        images.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        images.backgroundColor = UIColor.brown
        self.view.addSubview(images)
        
        let button = UIButton()
        button.frame = CGRect(x: images.frame.width-100, y: images.frame.height-100, width: 100, height: 100)
        button.setTitle("upload", for: .normal)
        button.addTarget(self, action: #selector(upload(btn:)), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        self.view.addSubview(button)
        
    }
    func  upload(btn:UIButton)
    {
        picker.delegate = self
        // picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        picker.modalPresentationStyle = .popover
        self.present(picker, animated: true,completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage{
            images.image = picker
            self.dismiss(animated: true, completion: nil)
            
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let selecteImageData:NSData = NSData(data: UIImageJPEGRepresentation(selectedImage, 1)!)
            let selctedImageSize:Int = selecteImageData.length
            print("image size : %d kb",selctedImageSize )
            cost = selctedImageSize*10
            print("cost:\(cost)")
        }
        
    }
    
}

