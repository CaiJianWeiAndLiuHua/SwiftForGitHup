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
    
    
    class func getWebHostURL() -> String {
    
    
        switch debug {
            
        case .HoseOnline:
            return "http://www.58xueche.com"
            
        case .Debug:
            return "http://xueche.test.58v5.cn"
            
        default:
            
            return "onLine nothing"
            
        }

    
    
    
    
    }
    
    
    
    
    
}

struct HttpChildURL {

    static let bandHomeURL = "\(HTTP.getHostURL())/ads/pic"

    static let enrollURL = "\(HTTP.getHostURL())/classtype/list"

    static let webURLEn =  "\(HTTP.getWebHostURL())/bm/classes_intro"





}

//常用定义变量用于

struct kfNameLet {
    
    static let apiversion = "apiversion"
    static let appviewsion = "appversion"
    static let os = "os"
    static let productorid = "productorid"
    static let description = "description"
    static let classname  = "classname"
    
    static let imageurl = "imageurl"
    
    static let result  = "result"
    
    static let list  = "list"
    
    static let action = "action"
    
    static let url = "url"
    
    static let phonedes = "phonedes"
    static let title = "title"
    
    static let  price  = "price"
    
    static let channelid = "channelid"
    
    
    static let classes  = "classes"
    
    
    static let iconimg  = "iconimg"
}


struct ACTION {
    
       static let  actiontype = "actiontype"
    
       static let  extparam = "extparam"
    
       static let   pagetype  = "pagetype"
    
       static let   rightbaritemtype = "rightbaritemtype"
    
       static let    title = "title"
    
       static let     url  = "url"
    
    
}







