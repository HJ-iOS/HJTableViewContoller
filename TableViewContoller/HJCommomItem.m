//
//  HJCommomItem.m
//  
//
//  Created by admin on 15/12/24.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import "HJCommomItem.h"
@interface HJCommomItem ()
@end
@implementation HJCommomItem
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon{
    HJCommomItem * item = [[self alloc]init];
    item.title = title;
    item.icon = icon;
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithTitle:title icon:nil];
}
@end
