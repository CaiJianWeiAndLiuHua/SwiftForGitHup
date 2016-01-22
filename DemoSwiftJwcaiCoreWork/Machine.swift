//
//  Machine.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation
import UIKit
//设备的高度和宽度  

struct Mobile {
    
    static let height = UIScreen.mainScreen().bounds.height
    
    static let width = UIScreen.mainScreen().bounds.width
    
    static let ratio =     width/320
    
    
    
//   设备名称
    static let name = UIDevice.currentDevice().name
    
    
//    app  系统版本
    static let systemVersion = UIDevice.currentDevice().systemVersion
  
    
//    系统名称
    static let systemName = UIDevice.currentDevice().systemName
    
    
//    app 发行版本
    
    static let versionApp  = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]!
    
    
//   app  name
    
    static let  appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"]!
    
    
    
    
    
}



struct Constand {
    
    static let apiversion = "4"
    
    static let channelid = "80000"
    
    static let os = "ios"
    
    static let productorid = "29"
    
    
//    用于测试数据
     static let  phonedes = "E17CF375E1EF1E82E2D0AD8B7DC805AE"
    
    
}





