//
//  EnrollViewWebViewController.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/22.
//  Copyright © 2016年 jw. All rights reserved.

import UIKit

class EnrollViewWebViewController: BaseViewController ,UIWebViewDelegate{

 
    @IBOutlet weak var enrollWebView: UIWebView!
    
    
    
    
    @IBAction func masterEnroll(sender: AnyObject) {
        
        
        
        
    }
    @IBAction func callPhone(sender: AnyObject) {
        
        
        "4000240658".callNumber()
        
        
    }

    
    
    
    
    var pararamer:NSDictionary! {
    
        didSet{
        
            
        }
     
    
    
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    
    
       print("::::::   \(request.URL)")
    
        return true
    
    }
    
    
    
   override func viewDidLoad() {
       super.viewDidLoad()
    
    if let  _ = pararamer {
        
        
        let urlString:NSString = "\(HttpChildURL.webURLEn)?type=\(pararamer[kfNameLet.ID]!)&os=\(Constand.os)"
        
                    enrollWebView.loadRequest(NSURLRequest(URL: NSURL(string: urlString as String)!))
        
        self.title = pararamer[kfNameLet.classname] as? String
        
        
        
        
    }
    

    
    
    
    
    }
    
    
    
    
    
    
    
    
    
}
