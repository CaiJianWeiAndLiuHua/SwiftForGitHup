//
//  PickImageViewCollection.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/2/10.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

struct PICK_IMAGE {

   static let higtRow = 90 * Mobile.ratio

  static  let widthRow = Mobile.width


}


class PickImageViewCollectionCell: UICollectionViewCell {


         
    var imageSource:AnyObject?{

        didSet{
            if let imageString:NSString = (imageSource as! NSString) {
                if imageString.hasPrefix("http:") {

              imageView.sd_setImageWithURL(NSURL(string: imageString as String), placeholderImage: UIImage(named: "changdi"))

                } else {

               imageView.image = UIImage(named: imageString as String)


                }


            } else if let imageData:UIImage = (imageSource as! UIImage){

               imageView.image = imageData

            }


        }

    }

    private lazy var imageView:UIImageView = {

        var  image = UIImageView(frame: CGRectMake(0, 0, PICK_IMAGE.widthRow, PICK_IMAGE.higtRow))
           self.addSubview(image)

       return image
    }()

}
