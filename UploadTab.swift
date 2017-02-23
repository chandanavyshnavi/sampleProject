//
//  UploadTab.swift
//  photosApp
//
//  Created by vyshnavi k on 18/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit
class UploadTab: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
var myimage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

    
        view.backgroundColor = UIColor.cyan
        myimage.frame = CGRect(x: 0, y: 10, width: self.view.frame.width, height: 200)
        myimage.backgroundColor = UIColor.gray
        self.view.addSubview(myimage)
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: self.view.frame.height-100, width: self.view.frame.width, height: 50)
        button.setTitle("upload", for: .normal)
        button.addTarget(self, action: #selector(upload(btn:)), for: .touchUpOutside)
        button.backgroundColor = UIColor.purple
        self.view.addSubview(button)
        let upload = UIAlertController(title: "Upload", message: "upload photo", preferredStyle: .actionSheet)
        
        let takePhoto = UIAlertAction(title: "TakePhoto", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let picker = UIImagePickerController()
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            self.present(picker,animated: true,completion: nil)
            
            
            
            
        })
        
        let choose = UIAlertAction(title: "choose existing photo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            picker.modalPresentationStyle = .popover
            self.present(picker, animated: true,completion: nil)
            
        })
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        upload.addAction(takePhoto)
        upload.addAction(choose)
        upload.addAction(cancel)
        
        self.present(upload,animated: true,completion:nil)
        
        
        
    }
    func upload(btn:UIButton){
        
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myimage.image = picker
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
}

    
    
    
    


