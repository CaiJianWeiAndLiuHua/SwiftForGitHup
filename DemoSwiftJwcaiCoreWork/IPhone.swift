//
//  IPhone.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/17.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class IPhone: NSObject {

}


struct Device {


    static let height = UIScreen.mainScreen().bounds.height

    static let width = UIScreen.mainScreen().bounds.width

    static let deviceName = UIDevice.currentDevice().name
    
}



struct KfDefineKey {
    static let  name = "name"
    static let  passWord = "password"

}