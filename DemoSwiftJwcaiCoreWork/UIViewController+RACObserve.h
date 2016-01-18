//
//  UIViewController+RACObserve.h
//  DemoSwiftJwcaiCoreWork
//
//  Created by caijianwei58 on 16/1/18.
//  Copyright © 2016年 jw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"
@interface UIViewController (RACObserve)


-(RACSignal *)RACObserveValue;


@end
