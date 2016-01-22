//
//  EnrollViewTableView.swift

//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/22.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class EnrollViewTableView: UIView , UITableViewDataSource , UITableViewDelegate{
    
    var enrollDidSelectRow:((NSDictionary) -> Void)!
    
    
    
    
    private var dataSourceArray:NSArray? {
    
        didSet{
        
        self.tableView.reloadData()
        
        }
    
    }
    
   
    
    func startRequest(){
    
    HttpEnrollRequestData.POSTBaseRequest(baseurl: HttpChildURL.enrollURL, paramer: [kfNameLet.phonedes:Constand.phonedes], suceessMothed: { (afManage, respone) in
         let arrayList =   ((respone as! NSDictionary)[kfNameLet.result] as! NSDictionary)[kfNameLet.classes]
         self.addSubview(self.tableView)
        if let _ = arrayList {
        
            self.dataSourceArray = arrayList as? NSArray
            
        }
        
        }, errors: {
    
        (errors)  in
    
    
    })
    
    
    
    
    
    }
    
    
    
  private   lazy  var tableView : UITableView = {
    
        var  EntableView = UITableView(frame:CGRect(origin: CGPoint(x: 0, y: 0), size: self.frame.size),style:UITableViewStyle.Plain)
        // 设置tableView的数据源
        EntableView.dataSource=self
        // 设置tableView的委托
        EntableView.delegate = self
    
        EntableView.tableFooterView = UIView()
        //
        EntableView.registerClass(EnrollTableViewCell.self, forCellReuseIdentifier: EnrollTableViewCell.description())
    
        
        return EntableView
    
    
    }()
    
    
  
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

         let dicVale =   self.dataSourceArray![indexPath.row] as? NSDictionary

        
        print("xxxxx...... \(indexPath.row) :: \(dicVale)")
        
        
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        if let _ = self.dataSourceArray {
        
         return (self.dataSourceArray?.count)!
        }
        
          return 0
       
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
          return 80 * Mobile.ratio
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCellWithIdentifier(EnrollTableViewCell.description()) as! EnrollTableViewCell
     
        if  !(self.dataSourceArray?.count > indexPath.row) {
        
           return cell
        }
        
        
        cell.dicJsonValueChange = self.dataSourceArray![indexPath.row] as? NSDictionary
        return cell
    
    }
    
    

}
