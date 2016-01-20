//
//  HttpUrl.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation

enum HttpHostDebug{
    case  Debug
    case  HoseOnline
    case  NothingLine




}



class   HTTP {
//    修改测试环境和真实环境
  static  let debug = HttpHostDebug.HoseOnline
  class  func getHostURL() -> String{


        switch debug {

        case .Debug:
            return "http://api.xueche.test.58v5.cn"

        case .HoseOnline:
            return "http://api.58xueche.com"

        default:

            return "onLine nothing"

        }

    }
    
    
    
    
}

struct HttpChildURL {

    static let bandHomeURL = "\(HTTP.getHostURL())/ads/pic"









}

//常用定义变量用于

struct kfNameLet {
    
    static let apiversion = "apiversion"
    static let appviewsion = "appversion"
    static let os = "os"
    static let productorid = "productorid"
    
    
    
    static let imageurl = "imageurl"
    
    static let result  = "result"
    
    static let list  = "list"
    
    static let action = "action"
    
    static let url = "url"
    
    
    static let title = "title"
    
}







