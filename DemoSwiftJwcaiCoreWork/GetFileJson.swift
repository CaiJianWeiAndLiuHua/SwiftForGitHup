//
//  GetFileJson.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/20.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class GetFileJson: NSObject {

//    提供主页上的数据
    class func getHomeSourceCenterData() -> NSDictionary?{
    
    
      let path = NSBundle.mainBundle().pathForResource("xc_home", ofType: "json")
        
        let data =    NSData(contentsOfFile: path!)


        do{
        
        let dicJosn = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
        
            
            return dicJosn
        }
        

      }
    
//         return nil

    
    
}
