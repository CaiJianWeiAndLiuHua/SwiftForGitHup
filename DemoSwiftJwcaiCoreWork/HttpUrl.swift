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
            return "debug url"

        case .HoseOnline:
            return "onLine url"

        default:

            return "onLine nothing"

        }

    }
    
    
    
    
}

struct HtppChildURL {

    static let mainURL = "\(HTTP.getHostURL())/webView.com"









}




