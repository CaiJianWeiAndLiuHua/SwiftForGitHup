//
//  HomeDrawTouchView.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/20.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit





class HomeDrawTouchView: UIView {


    var touchCommand:((NSDictionary) -> Void)!


    var dicJsonParamer:NSDictionary?{

        didSet{


        }

    }

    lazy var lableCalculate:UILabel = {

        var lable = UILabel(frame: self.frame)


        return lable
    }();


//    override func setFrame(frame:CGRect){
//        super.setFrame(frame)
//
//
//    }




    var showMessageString:NSString = "好一个"  { didSet { setNeedsDisplay() } }

    var font:CGFloat = 14 { didSet { setNeedsDisplay() } }




//
    private func calculateWidth(rect:CGRect) -> CGPoint{
        addSubview(lableCalculate)
        lableCalculate.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(rect), height: 2)
        lableCalculate.font = UIFont.systemFontOfSize(font)
        lableCalculate.text = showMessageString as String
        lableCalculate.sizeToFit()

      print("frame:: \(lableCalculate.frame)")

       let frameFont = lableCalculate.frame
       let x  = (bounds.size.width - min(frameFont.size.width, bounds.size.width))/2
      print("xx:: \(x)")
       lableCalculate.removeFromSuperview()


      return CGPoint(x: x, y: bounds.height - 23 * Mobile.ratio)

    }





   override func drawRect(rect: CGRect){
       super.drawRect(rect)
//     let image = UIImage()

//        let string:NSString = "hello"

        if  let message:NSString = showMessageString{

           message.drawInRect(CGRect(origin: calculateWidth(rect), size: bounds.size), withAttributes: [NSForegroundColorAttributeName:UIColor.redColor(),NSFontAttributeName:UIFont.systemFontOfSize(font)])
        }


    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            backgroundColor = UIColor.redColor()
    }


  override  func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
          backgroundColor = UIColor.grayColor()
         setNeedsDisplay()

       dispatch_after(UInt64(0.5), dispatch_get_main_queue()) { () -> Void in

        if let touchClick:(NSDictionary) -> Void = self.touchCommand {

              touchClick(self.dicJsonParamer!)

        }

    }

    }


}
