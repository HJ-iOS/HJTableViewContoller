//
//  HJBadgeView.m
//  
//
//  Created by admin on 15/12/29.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import "HJBadgeView.h"

@implementation HJBadgeView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setBackgroundImage:[UIImage resizedImage:@"main_badge"] forState:UIControlStateNormal];
        // 在cell 中 角标的高度 是固定的  只有宽度的拉伸
        self.height = self.currentBackgroundImage.size.height;
    }
    return self;
}
-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = [badgeValue copy];
    //设置 显示的 消息数量
    [self setTitle:badgeValue forState:UIControlStateNormal];
    //根据文字 计算自己的尺寸
    CGSize titleSize = [badgeValue sizeWithFont:self.titleLabel.font];
    CGFloat countW = self.currentBackgroundImage.size.width;
    if (titleSize.width < countW) {
        self.width = countW;
    }else{
        self.width = titleSize.width + 10;
    }
}
@end
