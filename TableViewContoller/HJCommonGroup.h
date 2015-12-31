//
//  HJCommonGroup.h
//  new微博
//
//  Created by admin on 15/12/24.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJCommonGroup : NSObject
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
//数组中存放的都是item模型
@property (nonatomic, strong) NSArray *items;
+(instancetype)group;
@end
