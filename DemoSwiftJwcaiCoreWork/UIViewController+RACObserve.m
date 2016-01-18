//
//  UIViewController+RACObserve.m
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

#import "UIViewController+RACObserve.h"

@implementation UIViewController (RACObserve)

-(RACSignal *)RACObserveValue{


    
    
    return  RACObserve(self, title);
}


@end
