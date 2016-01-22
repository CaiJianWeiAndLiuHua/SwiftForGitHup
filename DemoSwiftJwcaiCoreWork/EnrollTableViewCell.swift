//
//  EnrollTableViewCell.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/22.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class EnrollTableViewCell: UITableViewCell {
    
    static let hightEnrollRow = 80 * Mobile.ratio
    
    
    var dicJsonValueChange:NSDictionary?{
    
    
        didSet{
            if let iconImage:String = dicJsonValueChange![kfNameLet.iconimg] as? String {
            
                heartImageView.sd_setImageWithURL(NSURL(string: iconImage), placeholderImage: UIImage(named: "jiaolian"))
                
               
            
            }
            
            
            if let iconTitle:String = dicJsonValueChange![kfNameLet.classname] as? String {
                
                heartTitleLable.text  = iconTitle
                
                
                
            }
            
            
            
            if let detailsMessage:String = dicJsonValueChange![kfNameLet.description] as? String {
                
                detailsTitleLable.text = detailsMessage
                
                
                
            }
            
            
            if let priceMessage = dicJsonValueChange![kfNameLet.price] {
                
                priceTitleLable.text = "\(priceMessage) 元"
                
                
                
            }
            
        
        
        
        }
    
    
    
    }
    
    
    
    lazy var heartImageView:UIImageView = {
    
      var heartImage = UIImageView(frame: CGRect(x: 15 * Mobile.ratio, y: (hightEnrollRow  - 60 * Mobile.ratio)/2, width: 60 * Mobile.ratio, height: 60 * Mobile.ratio))
        
          heartImage.image = UIImage(named: "changdi")
          self.addSubview(heartImage)
        
        return heartImage;
    
    
    }()
    
    
    lazy var  heartTitleLable:UILabel = {
    
        var titleLable = UILabel(frame: CGRect(x: 80, y: hightEnrollRow/2 - 30 * Mobile.ratio , width: 100 * Mobile.ratio, height: 30 * Mobile.ratio))
        
        titleLable.font = UIFont.systemFontOfSize(14.0)
        
        titleLable.text = "好朋友"
    
        self.addSubview(titleLable)

       return titleLable
    
    
    }()
    
    lazy var  detailsTitleLable:UILabel = {
        
        var titleLable = UILabel(frame: CGRect(x: 80, y: hightEnrollRow/2 , width: 100 * Mobile.ratio, height: 30 * Mobile.ratio))
        
        titleLable.font = UIFont.systemFontOfSize(12.0)
        
        titleLable.text = "好朋友 详情"
        
        titleLable.textColor = RGBA(1,1,1,0.3)
        
        self.addSubview(titleLable)

        
        
        return titleLable
        
        
    }()
    
    lazy var  priceTitleLable:UILabel = {
        
        var titleLable = UILabel(frame: CGRect(x:Mobile.width - 120 * Mobile.ratio , y: hightEnrollRow/2 - 15 * Mobile.ratio, width: 100 * Mobile.ratio, height: 30 * Mobile.ratio))
        
        titleLable.font = UIFont.systemFontOfSize(15.0)
        
        titleLable.text = "2000.0元"
        
//        NSTextAlignment.
        titleLable.textAlignment = .Right
        
//        titleLable.textColor = RGBA(1,1,1,0.3)
        
        
        self.addSubview(titleLable)
        
        
        
        return titleLable
        
        
    }()
    
    
    
    

}
