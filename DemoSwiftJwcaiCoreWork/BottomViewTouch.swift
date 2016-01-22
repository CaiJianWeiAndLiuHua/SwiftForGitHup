//
//  BottomViewTouch.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/21.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class BottomViewTouch: UIView {

    var bottomTagIndex:((NSInteger) -> Void)!

    class  func initWithFrameView(cgrect:CGRect) -> BottomViewTouch{

        let bottomView = BottomViewTouch(frame: cgrect)


       print("ration \(Mobile.ratio) :: frame \(cgrect)")

         bottomView.addViewItem()

        return bottomView

        __FUNCTION__ 
    }
    let bottomTitleArrayName:[String] = ["主页","报名","培训"]
    
    private func addViewItem(){
    let width = CGRectGetWidth(self.frame)
    let height = CGRectGetHeight(self.frame)


        for i  in 1...3 {
            let itemView = BottomItemView(frame:CGRect(origin: CGPoint(x: CGFloat(i - 1) * width/3, y: 0), size: CGSize(width: width/3, height: height)))
            let bottomDiction = [BottomKey.bottomHeartImage:"home\(i)",BottomKey.bottomHeartTitle:bottomTitleArrayName[i - 1]]
            itemView.tag = 100 * i
            itemView.setChangValueDiction = bottomDiction
            itemView.backgroundColor = RGB(CGFloat(rand() % 256), CGFloat(rand() % 256), CGFloat(rand() % 256))
//            arc4random_addrandom(<#T##UnsafeMutablePointer<UInt8>#>, <#T##Int32#>)
            itemView.touchButtomItemTouch = {

               (itemViewTouch) in
                let touchItem:BottomItemView = itemViewTouch
                for index in 1...3 {
                    let item:BottomItemView =  self.viewWithTag(index * 100) as! BottomItemView

                    let bottomDiction = [BottomKey.bottomHeartImage:"home\(index)",BottomKey.bottomHeartTitle:self.bottomTitleArrayName[index - 1]]

                    item.setChangValueDiction = bottomDiction
//                        item.backgroundColor = RGB(255, 0, 0)
                }

                print("select tag item index \(touchItem.tag)")
                 touchItem.setChangValueDiction = [BottomKey.bottomHeartImage:"homes\(touchItem.tag/100)",BottomKey.bottomHeartTitle:self.bottomTitleArrayName[touchItem.tag/100 - 1]]
                if let _ = self.bottomTagIndex {

                           self.bottomTagIndex(touchItem.tag)
                }

            }

            self.addSubview(itemView)

        }

     let bottombar1 = self.viewWithTag(100) as! BottomItemView
        bottombar1.setChangValueDiction = [BottomKey.bottomHeartImage:"homes1",BottomKey.bottomHeartTitle:bottomTitleArrayName[0]]


        
    }
    
    
    

}
