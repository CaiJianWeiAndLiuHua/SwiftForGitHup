//
//  AFhttpRequestMothed.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation

class AFHttpRequestData {
//    网路请求 post
   class  func POST(urlBase urlBase:String,parame:AnyObject?,suceessMothed:(afManage:AFHTTPRequestOperation,respone:AnyObject)->Void,errors:(errorMessage:NSError)->Void){
//    HTTP.getHostURL()
    

    let afManger = AFHTTPRequestOperationManager()
    afManger.responseSerializer.acceptableContentTypes = NSSet(array: ["text/html","text/javascript"]) as! Set<String>

    afManger.POST(urlBase, parameters: parame, success: {
            (operation,respone) in
              suceessMothed(afManage: operation,respone: respone)

        }, failure: {

            (operation,error) in

             errors(errorMessage: error)
    })




    }


    class  func GET(urlBase urlBase:String,parame:AnyObject?,suceessMothed:(afManage:AFHTTPRequestOperation,respone:AnyObject)->Void,errors:(errorMessage:NSError)->Void){


        let afManger = AFHTTPRequestOperationManager()
        afManger.responseSerializer.acceptableContentTypes = NSSet(array: ["text/html","text/javascript"]) as! Set<String>
//        afManger.responseSerializer = AFHTTPResponseSerializer()

        afManger.GET(urlBase, parameters: parame, success: {
            (operation,respone) in
            suceessMothed(afManage: operation,respone: respone )

            }, failure: {

                (operation,error) in
                
                errors(errorMessage: error)
        })
        
        
        
        
    }




}



