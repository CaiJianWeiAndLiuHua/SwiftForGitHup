//
//  HttpEnrollRequestData.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/22.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class HttpEnrollRequestData: AFHttpRequestData {

    
    
    class func POSTEnrollRequest(baseurl baseurl:NSString,paramer:NSDictionary?,suceessMothed:(afManage:AFHTTPRequestOperation,respone:AnyObject)->Void,errors:(errorMessage:NSError)->Void) {
        
        
        let dicJson = NSMutableDictionary()
        
        dicJson.addEntriesFromDictionary([kfNameLet.phonedes:Constand.phonedes])
        
        if let _ = paramer {
        dicJson.addEntriesFromDictionary(paramer! as [NSObject : AnyObject])
        }
    
        
        
        HttpEnrollRequestData.POSTBaseRequest(baseurl: baseurl, paramer: dicJson, suceessMothed: suceessMothed, errors: errors)
        
        
    }
    
    class  func POSTBaseRequest(baseurl baseurl:NSString,paramer:NSDictionary?,suceessMothed:(afManage:AFHTTPRequestOperation,respone:AnyObject)->Void,errors:(errorMessage:NSError)->Void){
    
        
        let dicJson = NSMutableDictionary()
       
        dicJson.addEntriesFromDictionary([kfNameLet.apiversion:Constand.apiversion,kfNameLet.appviewsion:Mobile.versionApp,kfNameLet.os:Constand.os,kfNameLet.phonedes:Constand.phonedes,kfNameLet.productorid:Constand.productorid,kfNameLet.channelid:Constand.channelid])
        
        if let _ = paramer {
            dicJson.addEntriesFromDictionary(paramer! as [NSObject : AnyObject])
        }

        
        
    
         AFHttpRequestData.POST(urlBase: baseurl as String, parame: dicJson, suceessMothed: suceessMothed, errors: errors)
        
        
    
    }
    
    
    
    
    
}
