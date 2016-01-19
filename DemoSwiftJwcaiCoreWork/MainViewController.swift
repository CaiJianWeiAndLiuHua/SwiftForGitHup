//
//  ViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/17.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit


//#define RACObserve(TARGET, KEYPATH) \
//({ \
//_Pragma("clang diagnostic push") \
//_Pragma("clang diagnostic ignored \"-Wreceiver-is-weak\"") \
//__weak id target_ = (TARGET); \
//[target_ rac_valuesForKeyPath:@keypath(TARGET, KEYPATH) observer:self]; \
//_Pragma("clang diagnostic pop") \
//})


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AFHttpRequestData.GET(urlBase: "http://api.map.baidu.com/telematics/v3/weather", parame: ["location":"116.305145,39.982368","output":"json","ak":"E65b25b1cc0634dafb1be93818004a21"], suceessMothed: { (afManage, respone) -> Void in


            print("respone : \(respone)")

//            NSUTF8StringEncoding
//        let json =     NSString(data: respone as! NSData, encoding:NSUTF8StringEncoding )
//
//         pr

            }, errors: {(error)  in

            }
        )
        
        let appViewsionKeyRoot = "\(Mobile.versionApp):\(Mobile.appName)"
        
        let user = NSUserDefaults.standardUserDefaults()

         print("child....test url \(HtppChildURL.mainURL)")

        
        dispatch_after(UInt64(0.5), dispatch_get_main_queue()) { () -> Void in
            
            if !user.boolForKey(appViewsionKeyRoot) {
                
                self.gotoNextFristPageNav()
                
            } else
                
            {
                
                self.gotoAppHomeViewController()
                
            }
            
            
        }
        
        
        
    
        
        
   
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
 override   func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
      let navC =  segue.destinationViewController
        
        
      if navC.isKindOfClass(UINavigationController.classForCoder()) {
    
        (navC as! UINavigationController).topViewController!.title = "Home中间View"
    }
    }
    
    

//   进入导航页面  
    
    func gotoNextFristPageNav(){
    
      performSegueWithIdentifier("gotoNext", sender: nil)
    
    
    }
    
//    进入app页面
    
    func gotoAppHomeViewController(){
    
       performSegueWithIdentifier("gotoAppHome", sender: nil)
    }
    
    


}

