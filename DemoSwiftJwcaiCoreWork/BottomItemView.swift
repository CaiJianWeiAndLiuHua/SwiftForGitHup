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

    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dispatch_after(UInt64(0.5), dispatch_get_main_queue()) { () -> Void in

            if let _ = self.touchButtomItemTouch {

                   self.touchButtomItemTouch(self)

            }




        }
    }

}
