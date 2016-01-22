//
//  BottomItemView.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/21.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class BottomItemView: UIView {

     var touchButtomItemTouch:((BottomItemView) -> Void)!

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//       heartImageView.image = UIImage(imageLiteral: "changdi")
//       bottomName.text = "姓名 xxx"
    }
   static  let prentBottom:CGFloat = 0.7
    lazy var heartImageView:UIImageView = {

     let hight = CGRectGetHeight(self.frame)
     let width = CGRectGetWidth(self.frame)
     let imgeHight = hight * (35.0/50.0) * prentBottom
     let y =  (hight * (35.0/50.0) - imgeHight)/2
     let x = (width - imgeHight)/2


      var heartimage = UIImageView(frame: CGRect(x: x, y: y, width: imgeHight, height: imgeHight))
          heartimage.contentMode  = .ScaleToFill
        self.addSubview(heartimage)


     return heartimage
    }()

    lazy var bottomName:UILabel = {

        let hight = CGRectGetHeight(self.frame)
        let width = CGRectGetWidth(self.frame)
        let imgeHight = hight * 35.0/50.0
        let x = (width - imgeHight)/2


        var bottomTextLable = UILabel(frame: CGRect(x: 0, y: imgeHight, width: width, height: hight - imgeHight))

        bottomTextLable.text = "xxx"
        bottomTextLable.textColor = RGB(180,180,180)
        bottomTextLable.textAlignment = .Center
        bottomTextLable.font = UIFont.systemFontOfSize(13.0)
        self.addSubview(bottomTextLable)
        
        
        return bottomTextLable
    }()




    var setChangValueDiction:NSDictionary! {

        didSet{

         bottomName.text =  setChangValueDiction[BottomKey.bottomHeartTitle] as? String

      let imageString =  (setChangValueDiction[BottomKey.bottomHeartImage] as? NSString)
            bottomName.textColor = (imageString?.length > 5) ? UIColor.orangeColor() : RGB(180, 180, 180)


        heartImageView.image =  UIImage(named: imageString! as String)


        }


    }



    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dispatch_after(UInt64(0.5), dispatch_get_main_queue()) { () -> Void in

            if let _ = self.touchButtomItemTouch {

                   self.touchButtomItemTouch(self)

            }




        }
    }

}
