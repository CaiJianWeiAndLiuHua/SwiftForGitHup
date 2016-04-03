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
            var pic:DCPicScrollView = DCPicScrollView.init(frame: CGRectMake(0, 0, Mobile.width, 120.0 * Mobile.ratio), withImageUrls: self.imageArray)
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

//中间 button 测试
    func creatMiddleView(){
    let dicJosn = GetFileJson.getHomeSourceCenterData()
    
        let listData:NSArray = ((dicJosn![KEY_NAME.downIntro] as! NSDictionary)[KEY_NAME.content] as! NSArray)
        
        
        
       
        for var i:Int = 0 ; i < listData.count ; i++ {
          
            let item:NSDictionary = listData[i] as! NSDictionary
            
            let homedraw = HomeDrawTouchView(frame:CGRect(x:CGFloat(i  % 2) * ( Mobile.width/2 + 0.5)  , y: 130.0 * Mobile.ratio  + CGFloat(i  / 2) * ((Mobile.width/2 - 0.5) * 9.0/16.0  + 1 * Mobile.ratio) , width: Mobile.width/2 - 0.5, height: (Mobile.width/2 - 0.5) * 9.0/16.0))
            homedraw.font = 14.0
            homedraw.backgroundColor = UIColor.whiteColor()
            homedraw.normalTouchColor = homedraw.backgroundColor!
            
            homedraw.showMessageString = item[KEY_NAME.itemname] as! String
            
            homedraw.highlightedTouchColor = RGB(210, 210, 210)
            homedraw.heartImageName  = item[KEY_NAME.iconurl] as! String
            //        homedraw .setNeedsDisplay()
            
            homedraw.touchCommand = {
                
                (dicJson) in
            
                self.didSelectAction(dicJson)

            }
            homedraw.dicJsonParamer =  item
        
         self.homeSollView.addSubview(homedraw)
        }
      callPhone(listData.count/2)
    }
    
    
//  创建大点好号码    
    
    private func callPhone(index:NSInteger){
    
        let buttonCall = UIButton(frame: CGRect(x: 0, y: 145.0 * Mobile.ratio  + CGFloat(index) * (Mobile.width/2) * (9.0/16.0), width: Mobile.width, height: 40 * Mobile.ratio))
        
        print(" :::::   \(buttonCall.frame)")
        buttonCall.backgroundColor = UIColor.whiteColor()
        buttonCall.titleLabel?.font = UIFont.systemFontOfSize(13.0)
        buttonCall .setImage(UIImage(named: "xczx"), forState: .Normal)
        buttonCall .setTitle("  (400-024-0658)", forState: .Normal)
        buttonCall.setTitleColor(RGB(200, 200, 200), forState: .Normal)
        buttonCall.rac_command = RACCommand(signalBlock: { (buttonCall) -> RACSignal! in
            
            
              "4000240658".callNumber()
            
            
            return RACSignal.empty()
        })
        self.homeSollView.addSubview(buttonCall)
    }
    
    
    
    
    
    lazy var backImageView:UIImageView = {

       var imageView = UIImageView(frame: CGRectMake(0, 0, Mobile.width, 120 * Mobile.ratio) )

        imageView.image = UIImage(named: "pageGuide1")
        return imageView


    }()
    
    
    
    
    
    lazy var homeSollView:UIScrollView = {
    
    
        var scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: Mobile.width, height: Mobile.height - 64 - 50))
        scroll.backgroundColor = UIColor.clearColor()
         scroll.addSubview(self.backImageView)
    
        
        
    return scroll
    }()
    
    
    
    
    
    
    

//    请求轮播图   重要数据
    func requestHttpDataView(){
     self.addSubview(homeSollView)
      creatMiddleView()
        
        AFHttpRequestData.GET(urlBase: HttpChildURL.bandHomeURL, parame: [kfNameLet.apiversion:Mobile.versionApp,kfNameLet.os:"ios",kfNameLet.productorid:"29"], suceessMothed: { (afManage, respone) -> Void in
            
            let dicJosData = (respone as! NSDictionary)
            let arrayJson = (dicJosData[kfNameLet.result] as! NSDictionary)[kfNameLet.list]
             print("json :: \(dicJosData) arrray :: \(arrayJson!)")
            
             self.allDataList =  (arrayJson! as! NSArray)
            }, errors: {(error)  in
                
            }
            
            
            
        )

    }





    
    
    
}
