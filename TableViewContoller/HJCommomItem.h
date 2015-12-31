//
//  HJCommomItem.h
//  用一个HJCommomItem模型 来秒速每行的信息: 图标  标题  子标题 右边的样式(箭头 文字 数字 开关 对勾)
//
//  Created by admin on 15/12/24.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJCommomItem : NSObject
//图标
@property (nonatomic, copy) NSString *icon;
//标题
@property (nonatomic, copy) NSString *title;
//子标题
@property (nonatomic, copy) NSString *subtitle;
//消息数量
@property (nonatomic, copy) NSString *badgeValue;
//点击cell,需要跳转到哪个控制器
@property (nonatomic, assign) Class destVcClass;

/** 封装点击这行cell想做的事情 */
// block 只能用 copy
@property (nonatomic, copy) void (^operation)();

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
