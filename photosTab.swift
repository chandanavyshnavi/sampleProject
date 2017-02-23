//
//  ViewController.swift
//  collectionView
//
//  Created by vyshnavi k on 21/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import UIKit
import Photos

    class photosTab: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
      
        @IBOutlet weak var collect: UICollectionView!
        var imageArray = [UIImage]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
           
            collect.delegate = self
            collect.dataSource = self
        
            grabPhotos()
        
        }
        
   
        func grabPhotos() {
            
            let imgManager = PHImageManager.default()
            
            let requesstOptions = PHImageRequestOptions()
            requesstOptions.isSynchronous = true
            requesstOptions.deliveryMode = .highQualityFormat
            
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            
            if let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions) {
                
                if fetchResult.count > 0 {
                    for i in 0..<fetchResult.count{
                        
                        let status = PHPhotoLibrary.authorizationStatus()
                        if(status == PHAuthorizationStatus.authorized){
                        
                         imgManager.requestImage(for: fetchResult.object(at: i) , targetSize: CGSize(width:100, height: 100), contentMode: .aspectFill, options: requesstOptions, resultHandler: {
                         
                            
                            
                            
                            image, error in
                            self.imageArray.append(image!)
                            print("image display")
                            
                            print("array count is ",self.imageArray.count)
                            self.collect.reloadData()
                        })
                    }
                    
                }
            }
        }
        
        }
        
        
        
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell! {
            var cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = UIColor.cyan
            var imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = imageArray[indexPath.row]
            
            return cell
        }
        
    }
    



