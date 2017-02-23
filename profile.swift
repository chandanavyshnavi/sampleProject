//
//  profile.swift
//  photosApp
//
//  Created by vyshnavi k on 18/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit
class profile: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var textBox = UITextField()
    var locationPicker = UIPickerView()
    var myimage = UIImageView()
    var button = UIButton()
    var  chosenImage = UIImage()
    
    
    
    var list = ["india","china","japan","france","sweden","usa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        myimage.frame = CGRect(x: 10, y: 50, width: self.view.frame.size.width, height: 150)
        myimage.backgroundColor = UIColor.white
        
        self.view.addSubview(myimage)
        
        button.frame = CGRect(x: myimage.frame.width-100, y: myimage.frame.height-10, width: 100, height: 50)
        button.setTitle("UPLOAd", for: .normal)
        button.addTarget(self, action: #selector(self.upload(btn:)), for: .touchUpInside)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.darkText, for: .highlighted)
        self.view.addSubview(button)
        
       var name = UITextField()
        name.frame = CGRect(x: 10, y: 250, width: self.view.frame.width, height: 50)
        name.keyboardType = .default
        name.textColor  = UIColor .black
        name.backgroundColor = UIColor.gray
        self.view.addSubview(name)
        
        
        textBox.frame = CGRect(x: 10, y: 350, width: self.view.frame.width, height: 30)
        textBox.backgroundColor = UIColor.cyan
        self.view.addSubview(textBox)
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        locationPicker.backgroundColor = UIColor.lightGray
        locationPicker.frame = CGRect(x: 10, y: 400, width: self.view.frame.width, height: 80)
        self.view.addSubview(locationPicker)

    }
    
    func upload(btn:UIButton){
     
             let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            picker.modalPresentationStyle = .popover
            self.present(picker, animated: true,completion: nil)
           
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.textBox.text = self.list[row]
        return list[row]
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



