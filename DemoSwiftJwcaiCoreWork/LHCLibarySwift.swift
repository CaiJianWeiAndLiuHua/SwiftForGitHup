//
//  LHCLibarySwift.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/3/4.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation
import UIKit


private struct KF_AC_LC{
    
    static var  kfButtonName = "kfButtonName"
    
    static var  kfAlertName = "kfAlertName"
    
}




extension UIButton{
    
    
   
    

    var commond:LHCObserve{
    
    
        get{
            
            if let _ = objc_getAssociatedObject(self, &KF_AC_LC.kfButtonName) {
               
                
             return objc_getAssociatedObject(self, &KF_AC_LC.kfButtonName) as! LHCObserve
            
            }else{
                
//                self.commond = LHCObserve()
                 objc_setAssociatedObject(self, &KF_AC_LC.kfButtonName, LHCObserve(commondTouchObserve: { (buttion) -> Void in
                    
                 }), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return objc_getAssociatedObject(self, &KF_AC_LC.kfButtonName) as! LHCObserve
            
            }
            
            
            
            
        
            
            
            
        
        }
    
    
        set{
           
              objc_setAssociatedObject(self, &KF_AC_LC.kfButtonName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
             self.addTarget(self, action: "touchButton", forControlEvents: UIControlEvents.TouchUpInside)
        }
    
    }


    public func touchButton(){
      
              self.commond.commondTouchObserve(self)
       
      
    
    
    }


}




extension UIAlertView {

    var command:LHCAlert{
    
        get{
            
            if let _ = objc_getAssociatedObject(self, &KF_AC_LC.kfAlertName) {
                
                
                return objc_getAssociatedObject(self, &KF_AC_LC.kfAlertName) as! LHCAlert
                
            }else{
                
//                self.command = LHCAlert()
                objc_setAssociatedObject(self, &KF_AC_LC.kfAlertName, LHCAlert(), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return objc_getAssociatedObject(self, &KF_AC_LC.kfAlertName) as! LHCAlert
                
            }
            
            
            
            
            
            
            
            
            
        }
        
        
        set{
            
            objc_setAssociatedObject(self, &KF_AC_LC.kfButtonName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
//            self.addTarget(self, action: "touchButton", forControlEvents: UIControlEvents.TouchUpInside)
        }






}


}





