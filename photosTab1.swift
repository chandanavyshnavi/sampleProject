//
//  File.swift
//  photosApp
//
//  Created by vyshnavi k on 21/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import UIKit
import Photos

class photosTab1: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collectionView: UICollectionView!
    //@IBOutlet var mycollect: UICollectionView!
   // @IBOutlet weak var collect: UICollectionView!
    
    var extraview:UIView = UIView()
    
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        grabPhotos()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                            self.collectionView?.reloadData()
                        })
                    }
                    
                }
            }
        }
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let imgView = UIImageView()
        imgView.frame = CGRect(x: 0, y: 0, width: 90, height: 100)
        cell.addSubview(imgView)
        imgView.image = self.imageArray[indexPath.row]
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        //self.animateZoomforCell(zoomCell: collectionView.cellForItem(at: indexPath)!)
        extraview = UIView()
        extraview.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        extraview.backgroundColor = UIColor.black
        
        let imgvvv = UIImageView()
        imgvvv.frame = CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: self.view.frame.size.height - 60)
        imgvvv.backgroundColor = UIColor.clear
        imgvvv.image = self.imageArray[indexPath.row]
        
        let closeBtn = UIButton()
        closeBtn.frame = CGRect(x: 10, y: 10, width: 100, height: 25)
        closeBtn.setTitle("close", for: .normal)
        closeBtn.addTarget(self, action: #selector(self.closeBtn), for: .touchUpInside)
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(extraview)
        self.extraview.addSubview(closeBtn)
        self.extraview.addSubview(imgvvv)
    }
    func closeBtn() {
        self.extraview.subviews.forEach({$0.removeFromSuperview()})
        self.extraview.removeFromSuperview()
        self.collectionView.reloadData()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func animateZoomforCell(zoomCell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {() -> Void in
            let x = zoomCell.frame.size.width / 5
            let y = zoomCell.frame.size.height / 1.5
            zoomCell.transform = CGAffineTransform(scaleX: x, y: y)
        }, completion: {(finished: Bool) -> Void in
            
            //self.animateZoomforCellremove(zoomCell: zoomCell)
        })
    }
    
    func animateZoomforCellremove(zoomCell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {() -> Void in
            zoomCell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: {(finished: Bool) -> Void in
            
            self.extraview.removeFromSuperview()
            self.collectionView.reloadData()
            
        })
    }
}











