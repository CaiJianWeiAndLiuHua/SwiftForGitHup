//
//  HomeViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy var navXueCheImage:UIImageView = {
    
       
        var navImage = UIImageView(frame: CGRectMake(Mobile.width/2 - 30.0 , 40, 60, 15))
        navImage.image = UIImage(named: "xuechetitleimage")
        
        
        return navImage
    
    
    
    }()
    
    
    
    override func viewDidLoad() {
        
       super.viewDidLoad()
        
       
        navLable .removeFromSuperview()
        view.addSubview(navXueCheImage)
        
    
        
        
        
        
    }
    
    

    
    
    
    
}
