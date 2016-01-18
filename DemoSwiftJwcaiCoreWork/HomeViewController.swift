//
//  HomeViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
  
//    lazy var home:HomeView = {
//    
//        var homeV = HomeView()
//        
//        homeV.frame = CGRect(x: 0, y: 64, width: Mobile.width, height: Mobile.height - 64 - 50)
//        
//        
//        return homeV
//    
//    
//    
//    }()
    
    
    
    
    
    
    
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
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view .endEditing(true)
    }
    
    
    
}
