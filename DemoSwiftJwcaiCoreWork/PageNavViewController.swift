//
//  PageNavViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit


//   引导页面


class PageNavViewController: UIViewController,UIScrollViewDelegate {
    
    
    
    
    
    
    
    
    lazy var pageController :UIPageControl = {
    
    
               var pageControl = UIPageControl(frame: CGRect(x: 0, y: 4.4/5 * Mobile.height, width: Mobile.width, height: 40.0))
        
                  pageControl.numberOfPages = 3
                  pageControl.pageIndicatorTintColor = UIColor.greenColor()
                  pageControl.currentPageIndicatorTintColor = UIColor.grayColor()
        
                  pageControl.rac_signalForControlEvents(UIControlEvents.ValueChanged).subscribeNext({ (pageControls) -> Void in
                       let pc = pageControls as! UIPageControl
                    
                    self.pageScrollView.setContentOffset(CGPoint(x:CGFloat(pc.currentPage) * Mobile.width, y: 0), animated: false)
                    
                  })
        
        
        return pageControl
    
    
    
    }()

//

    
    
    
    
    
    
    lazy var pageScrollView:UIScrollView = {
    
            var   mainScrollView = UIScrollView(frame:CGRect(x: 0, y: 0, width: Mobile.width, height: Mobile.height))
        
             mainScrollView.pagingEnabled = true
             mainScrollView.bounces = true
             mainScrollView.delegate = self
        
        for  i  in  1...3{
             let imageView = UIImageView(frame: CGRectMake(Mobile.width * CGFloat(i - 1), 0, Mobile.width, Mobile.height))
                 imageView.image = UIImage(named: "pageGuide\(i)")
             mainScrollView.addSubview(imageView)
            
        
        }
        
        
        
        
        mainScrollView.contentSize = CGSize(width: Mobile.width * CGFloat(3), height: Mobile.height )
        
        mainScrollView.addSubview(self.buttonConnectionHome)
//             mainScrollView.delegate = self;
        
        
        return  mainScrollView
    
    
    
    }()
    

    lazy var buttonConnectionHome:UIButton = {
    
     let buttonHome = UIButton(frame: CGRect(x: Mobile.width * CGFloat(2.25), y: Mobile.height * 4.0/5, width: Mobile.width * 1.0/2, height: 45.0))
        
        buttonHome.rac_command = RACCommand(signalBlock: { (buttonCommand) -> RACSignal! in
            
            self.homeView()
                
            
            self.performSegueWithIdentifier("gotoHomeView", sender: nil)
            
            return RACSignal.empty()
        })
        
        buttonHome.setTitleColor(UIColor.redColor(), forState: .Normal)
        
        buttonHome.setTitle("进入主页", forState: .Normal)

        return buttonHome
    
    
    
    
    }()
    
    
    
    func homeView(){
    
    
       let user = NSUserDefaults.standardUserDefaults()
        user .setBool(true, forKey: "\(Mobile.versionApp):\(Mobile.appName)")
        user .synchronize()
    
    
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.purpleColor()
        view.addSubview(pageScrollView)
        view.addSubview(pageController)
//        view.addSubview(<#T##view: UIView##UIView#>)

        // Do any additional setup after loading the view.
    }
    
//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
     func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        
            let pageIndex  =    Int(scrollView.contentOffset.x / Mobile.width)
        
             pageController.currentPage = pageIndex
        
        
        
        
    }
    

}
