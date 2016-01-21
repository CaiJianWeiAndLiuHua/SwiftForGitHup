//
//  StringExtension.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/21.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation

extension  String{

    func  callNumber(){
    
      let webCall = UIWebView(frame: CGRect())
    
      let callString = "telprompt:\(self)"
        webCall.loadRequest(NSURLRequest(URL: NSURL(string: callString)!))
    
        UIApplication.sharedApplication().keyWindow?.addSubview(webCall)
    
    }


}


