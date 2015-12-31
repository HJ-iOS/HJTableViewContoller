//
//  HJTableViewCell.h
//  自定义cell
//
//  Created by admin on 15/12/25.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJCommomItem;
@interface HJTableViewCell : UITableViewCell
//cell 对应的item数据
@property (nonatomic, strong) HJCommomItem *item;
//确定cell的位置
//@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)setIndexpaath:(NSIndexPath *)indexPath rowsInSection:(int)rows;
@end
