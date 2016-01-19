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

    
 private   var  imageArray:[String]? {
    
        didSet{
        
            self .addSubview(picHomeScollView)
        
        }
    
    
    }
    

    
    
    lazy var picHomeScollView:DCPicScrollView  = {
        if let _ = self.imageArray {
            var pic:DCPicScrollView = DCPicScrollView.init(frame: CGRectMake(0, 0, Mobile.width, 100.0 * Mobile.ratio), withImageUrls: self.imageArray)
            pic.AutoScrollDelay = 4.0

            pic.imageViewDidTapAtIndex =  {

             (index)  in

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


        imageArray = ["http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg","http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png","http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg","http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg"];
    }





    
    
    
}
