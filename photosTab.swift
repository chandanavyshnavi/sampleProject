//
//  photosTab.swift
//  photosApp
//
//  Created by vyshnavi k on 20/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit
import Photos

class photosTab: UICollectionViewController {
   
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.delegate = self
        collectionView?.dataSource = self
        
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
             
                    
                    
                        imgManager.requestImage(for: fetchResult.object(at: i) as! PHAsset, targetSize: CGSize(width:100, height: 100), contentMode: .aspectFill, options: requesstOptions, resultHandler: {
                        
                        image, error in
                        self.imageArray.append(image!)
                        
                        print("array count is ",self.imageArray.count)
                        self.collectionView?.reloadData()
                    })
                }
                
            }
        }
    }
    
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        var imageView = cell.viewWithTag(1) as! UIImageView
    
        imageView.image = imageArray[indexPath.row]
        
        
        return cell
        
    }
    
    
}
