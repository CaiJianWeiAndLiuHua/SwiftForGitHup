//
//  LHCObserve.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/3/4.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class LHCObserve: NSObject {
    
    
    var commondTouchObserve:((UIButton) -> Void)
    
    
    init(commondTouchObserve:UIButton -> Void){
    
       self.commondTouchObserve = commondTouchObserve
    
    }
    
    
    
    
    
    
    
    

}
