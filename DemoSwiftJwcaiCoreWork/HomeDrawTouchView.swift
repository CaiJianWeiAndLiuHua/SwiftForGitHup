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
    var highlightedTouchColor:UIColor = RGBA(240, 240, 240, 0.5) {didSet{setNeedsDisplay()}}
    var normalTouchColor:UIColor = RGB(255, 0, 0)
    
    var heartImageName:NSString = "women" {
    
    
        didSet{ setNeedsDisplay() }
    
    }
    
    
    

    var showMessageString:NSString = "好一个"  { didSet { setNeedsDisplay() } }

    var font:CGFloat = 14 { didSet { setNeedsDisplay() } }


    
    
    
    lazy var lableCalculate:UILabel = {
        
        var lable = UILabel(frame: self.frame)
        
        
        return lable
    }();


    var dicJsonParamer:NSDictionary?{
        
        didSet{
            
            setNeedsDisplay()
        }
        
    }
    
    

//
    private func calculateWidth(rect:CGRect) -> CGPoint{
        addSubview(lableCalculate)
        lableCalculate.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(rect), height: 2)
        lableCalculate.font = UIFont.systemFontOfSize(font)
        lableCalculate.text = showMessageString as String
        lableCalculate.sizeToFit()
//        UIControlState.Normal
      print("frame:: \(lableCalculate.frame)")

       let frameFont = lableCalculate.frame
        let y = frameFont.height
       let x  = (bounds.size.width - min(frameFont.size.width, bounds.size.width))/2
      print("xx:: \(x)")
       lableCalculate.removeFromSuperview()


      return CGPoint(x: x, y: bounds.height - 8 * Mobile.ratio - y)

    }





   override func drawRect(rect: CGRect){
       super.drawRect(rect)
//     let image = UIImage()

//        let string:NSString = "hello"
         drawImage(rect)
        if  let message:NSString = showMessageString{

           message.drawInRect(CGRect(origin: calculateWidth(rect), size: bounds.size), withAttributes: [NSForegroundColorAttributeName:UIColor.redColor(),NSFontAttributeName:UIFont.systemFontOfSize(font)])
        }


    }
    
    func drawImage(rect:CGRect){
    
       let width = CGRectGetWidth(rect)
        let hight = CGRectGetHeight(rect)
        
        if let imageURLPath:NSString = self.heartImageName{
        
           let image = UIImage(named: imageURLPath as String)
            
            image?.drawInRect(CGRect(x: width/2 - hight/4, y: 10 * Mobile.ratio, width: hight/2, height: hight/2))
            
            
            
            
        }
        
        
    
    
    
    }
    
    
    
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            backgroundColor = highlightedTouchColor
    }


  override  func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
          backgroundColor = normalTouchColor
         setNeedsDisplay()

       dispatch_after(UInt64(0.5), dispatch_get_main_queue()) { () -> Void in

        if let touchClick:(NSDictionary) -> Void = self.touchCommand {
            
            if  let acitonDiction:NSDictionary   =     self.dicJsonParamer![KEY_NAME.action] as? NSDictionary{
            
              touchClick(acitonDiction)
            }
        }

    }

    }


}
