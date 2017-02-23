//
//  mapview.swift
//  photosApp
//
//  Created by vyshnavi k on 18/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit
import Photos
import CoreMedia
import CoreLocation
import AddressBook
import AddressBook
//import AssetsLibrary

class mapview: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var myimage = UIImageView()
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        myimage.frame = CGRect(x: 10, y: 50, width: self.view.frame.size.width, height: 150)
        myimage.backgroundColor = UIColor.white
        
        self.view.addSubview(myimage)
        
        
        picker.delegate = self
        self.photoFromLibrary()
        
        
        
        
    }
    func photoFromLibrary() {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        if let myImage = info[UIImagePickerControllerOriginalImage] as? UIImage  {
            UIImageWriteToSavedPhotosAlbum(myImage, self,#selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        dismiss(animated:true, completion: nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError: NSErrorPointer, contextInfo:UnsafeRawPointer)       {
        
        if (didFinishSavingWithError != nil) {
            print("Error saving photo: \(didFinishSavingWithError)")
        } else {
            print("Successfully saved photo, will make request to update asset metadata")
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
            
            let lastImageAsset = fetchResult.lastObject! as PHAsset
            var MyLat = 0.000
            var MyLong = 0.000
            if let mylat = lastImageAsset.location?.coordinate.latitude{
                MyLat = mylat
            }
            if let mylong = lastImageAsset.location?.coordinate.longitude{
                MyLong = mylong
            }
            let coordinate = CLLocationCoordinate2DMake(MyLat,MyLong)
            let nowDate = NSDate()
            let myLocation = CLLocation(coordinate: coordinate, altitude: 0.0, horizontalAccuracy: 1.0, verticalAccuracy: 1.0, timestamp: nowDate as Date)
            
            PHPhotoLibrary.shared().performChanges({
                let assetChangeRequest = PHAssetChangeRequest(for: lastImageAsset)
                assetChangeRequest.location = myLocation
            }, completionHandler: { (success, error) -> Void in
                if (success) {
                    print("Succesfully saved metadata to asset")
                    print("location metadata = \(myLocation)")
                } else {
                    print("Failed to save metadata to asset with error: \(error!)")
                }
                
            })
        }
    }
    
}






