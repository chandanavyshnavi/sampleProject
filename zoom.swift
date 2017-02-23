//
//  zoom.swift
//  photosApp
//
//  Created by vyshnavi k on 21/02/17.
//  Copyright © 2017 vyshnavi k. All rights reserved.
//

import Foundation
import UIKit

class zoom: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scroll.minimumZoomScale = 1.0
        self.scroll.minimumZoomScale = 10.0
        
        
        
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
