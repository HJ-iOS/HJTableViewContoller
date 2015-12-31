//
//  HJCommonViewController.h
//  建立该模型的父类 所有分区的子类都继承于他
//
//  Created by admin on 15/12/29.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJCommonViewController : UITableViewController
//存放分区的大数组
- (NSMutableArray *)groups;
@end
