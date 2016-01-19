//
//  HomeView.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

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


        imageArray = ["http://img4.imgtn.bdimg.com/it/u=128811874,840272376&fm=21&gp=0.jpg","http://img2.imgtn.bdimg.com/it/u=3922277475,817684749&fm=21&gp=0.jpg"];
    }





    
    
    
}
