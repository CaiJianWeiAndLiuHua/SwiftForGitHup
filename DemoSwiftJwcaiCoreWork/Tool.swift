//
//  Tool.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/21.
//  Copyright © 2016年 jw. All rights reserved.
//

import Foundation



// this tool is for Color  这里是16 进制 颜色 －－－－－－－－－－－－－－－－－－－


func  ColorHex(hex hex:Int64) -> UIColor{


    return ColorHex(hex:hex, alpha: 1)

}







func ColorHex(hex hex:Int64,alpha:CGFloat) -> UIColor{

 let r  = (hex&0xff0000) >> 16
    
 let g  = (hex&0x00ff00) >> 8

 let b = hex&0x0000ff


  return RGBA(CGFloat(r), CGFloat(g), CGFloat(b), alpha)

}


// RGB 颜色定义 －－－－－－－－－－－－－－－－－－－－－－－－－－




func   RGB(R:CGFloat,_ G:CGFloat,_ B:CGFloat) -> UIColor{


    return RGBA(R, G, B, 1)
}




func RGBA( R:CGFloat, _ G:CGFloat,_ B:CGFloat,_ A:CGFloat) -> UIColor{
    
       let   r =  CGFloat(max(min(255.0, R), 0))
    
       let   g =  CGFloat(max(min(255.0, G), 0))
    
       let   b  = CGFloat(max(min(255.0, B), 0))

       let   a = CGFloat(max(min(1, A), 0))
    
    
    return  UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)


}










