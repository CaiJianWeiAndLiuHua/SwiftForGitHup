//
//  BaseWebViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/20.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class BaseWebViewController: BaseViewController {

    
     lazy var webViewShow:UIWebView = {
    
        var webView:UIWebView = UIWebView(frame: CGRect(x: 0, y: 64, width: Mobile.width, height: Mobile.height - 64))
    
        return webView
    
    
    }()
    
    
    
    var urlDiction:NSDictionary?{
    
        didSet{
        let urlPatch = (urlDiction![kfNameLet.url] as! String)
         self.title =  (urlDiction![kfNameLet.title] as! String)
        
       webViewShow.loadRequest(NSURLRequest(URL: NSURL(string: urlPatch)!))
            
        }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webViewShow)
        
    }
    
    
    
    
    
    
}








