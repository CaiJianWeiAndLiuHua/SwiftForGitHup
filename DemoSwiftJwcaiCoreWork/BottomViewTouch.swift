//
//  BottomViewTouch.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/21.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class BottomViewTouch: UIView {

   

    class  func initWithFrameView(cgrect:CGRect) -> BottomViewTouch{

        let bottomView = BottomViewTouch(frame: cgrect)


       print("ration \(Mobile.ratio) :: frame \(cgrect)")

         bottomView.addViewItem()

        return bottomView

        
    }
    
    
    private func addViewItem(){
    let width = CGRectGetWidth(self.frame)
    let height = CGRectGetHeight(self.frame)


        for i  in 1...3 {
            let itemView = BottomItemView(frame:CGRect(origin: CGPoint(x: CGFloat(i - 1) * width/3, y: 0), size: CGSize(width: width/3, height: height)))

            itemView.tag = 100 * i

            itemView.backgroundColor = RGB(CGFloat(rand() % 256), CGFloat(rand() % 256), CGFloat(rand() % 256))
//            arc4random_addrandom(<#T##UnsafeMutablePointer<UInt8>#>, <#T##Int32#>)
            itemView.touchButtomItemTouch = {

               (itemViewTouch) in
                let touchItem:BottomItemView = itemViewTouch
                for index in 1...3 {
                    let item:BottomItemView =  self.viewWithTag(index * 100) as! BottomItemView

                        item.backgroundColor = RGB(255, 0, 0)
                }

                print("select tag item index \(touchItem.tag)")
                 touchItem.backgroundColor = RGB(220, 220, 220)


            }

            self.addSubview(itemView)

        }



        
    }
    
    
    

}
