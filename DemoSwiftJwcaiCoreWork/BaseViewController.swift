//
//  BaseViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var backButton:UIButton = {
        
        var back = UIButton(frame: CGRect(x: 15, y: 20, width: 24.0, height: 36.0))
        
        back.setImage(UIImage(imageLiteral: "backtrack"), forState: .Normal)
        back.rac_command = RACCommand(signalBlock: { (backButton) -> RACSignal! in
            
            print("back button")
            self.backViewController()
            return RACSignal.empty()
            
            
        })
        
        
        
        return back
        
    }()
    
    
    private func backViewController(){
    
        if let _ = navigationController{
             navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    
    var titleNav:String = "" {
    
        didSet{
        
           navLable.text = titleNav
        }
    
    }
    
    
    lazy var navView:UIView = {
    
       var nav =  UIView(frame: CGRect(x: 0, y: 0, width: Mobile.width, height: 64.0))
    
        nav.addSubview(self.navLable)
        nav.backgroundColor = UIColor.orangeColor()
        
        return nav
    
    }()
    
    
    
    lazy var navLable:UILabel = {
    
       var navLable = UILabel(frame: CGRect(x: 0, y: 20, width: Mobile.width, height: 44.0))
        navLable.textAlignment = .Center
        navLable.text = "中间title"
        navLable.font = UIFont.systemFontOfSize(19.0)
        
        navLable.textColor = UIColor.whiteColor()
        
        navLable.backgroundColor = UIColor.orangeColor()
        
        return navLable
    
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//          self.title = "喝咯咯";
        self.navigationController?.navigationBarHidden = true
        view.addSubview(navView)
        view.addSubview(backButton)
        
        self.RACObserveValue().subscribeNext { (title) -> Void in
            
            print("title :\(title)")
            if let titleLeve = title {
                self.titleNav = titleLeve as! String
            }
            
        }
        
        if !(self.navigationController?.viewControllers.count > 1){
        
           backButton.removeFromSuperview()
        
        }
        
//        if let _ = self.title{
//        
//         titleNav = self.title!
//        }
        
       
        
        view.backgroundColor = UIColor.redColor()
        
        
        
//          RACObserve(self,title).subscribeNext
     

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    移动事件  加动画
  
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
