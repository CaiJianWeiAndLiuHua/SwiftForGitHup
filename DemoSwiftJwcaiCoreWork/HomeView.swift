//
//  HomeView.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit
enum PageControlStyle:Int{
    case middleView

    case rightView



}






class HomeView: BaseView {

var didSelectAction:((NSDictionary) -> Void)!
    

    
 private   var  imageArray:[String]? {
    
        didSet{
          
            
            self .addSubview(picHomeScollView)
        
        }
    
    
    }
    
    private  var allDataList:NSArray?{
      
        didSet{
            var listArray:[String] = Array<String>();
            for  dicJson  in allDataList!{
            
                 listArray.append(dicJson[kfNameLet.imageurl] as! String)
            
            }
            
           imageArray = listArray
        }
    
    
    }
    
    
    lazy var picHomeScollView:DCPicScrollView  = {
        if let _ = self.imageArray {
            var pic:DCPicScrollView = DCPicScrollView.init(frame: CGRectMake(0, 0, Mobile.width, 100.0 * Mobile.ratio), withImageUrls: self.imageArray)
            pic.AutoScrollDelay = 4.0
            
            pic.imageViewDidTapAtIndex =  {

             (index)  in
                
//                if let _ = didSelectAction{
//                kfNameLet.list
                let  actionURL = ((self.allDataList![index] as! NSDictionary)[kfNameLet.action] as! NSDictionary)
                
                     self.didSelectAction(actionURL)
                
//                }
                
                print("index \(index)")


            };
        
           pic.setStyleIndex(1)
        return pic
        
        
        }
        
        return DCPicScrollView()
    
    
    }()

    func TapIndex(index:NSInteger) -> Void {

        print("tap...... select \(index)")

    }



    
    lazy var backImageView:UIImageView = {

       var imageView = UIImageView(frame: CGRectMake(0, 0, Mobile.width, 100 * Mobile.ratio) )

        imageView.image = UIImage(named: "pageGuide1")
        return imageView


    }()

//    请求轮播图
    func requestHttpDataView(){
     self.addSubview(backImageView)
      
        
        AFHttpRequestData.POST(urlBase: HttpChildURL.bandHomeURL, parame: [kfNameLet.apiversion:Mobile.versionApp,kfNameLet.os:"ios",kfNameLet.productorid:"29"], suceessMothed: { (afManage, respone) -> Void in
            
            let dicJosData = (respone as! NSDictionary)
            let arrayJson = (dicJosData[kfNameLet.result] as! NSDictionary)[kfNameLet.list]
             print("json :: \(dicJosData) arrray :: \(arrayJson!)")
            
             self.allDataList =  (arrayJson! as! NSArray)
            }, errors: {(error)  in
                
            }
            
            
            
        )

    }





    
    
    
}
