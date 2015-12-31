//
//  HJTableViewCell.m
//  自定义cell
//
//  Created by admin on 15/12/25.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import "HJTableViewCell.h"
#import "HJCommomItem.h"
#import "HJCommonArrow.h"
#import "HJCommonLabel.h"
#import "HJCommonSwitch.h"
#import "HJBadgeView.h"

@interface HJTableViewCell ()
/**
 *  箭头
 */
@property (strong, nonatomic) UIImageView *rightArrow;
/**
 *  开关
 */
@property (strong, nonatomic) UISwitch *rightSwitch;
/**
 *  标签
 */
@property (strong, nonatomic) UILabel *rightLabel;
/**
 *  提醒数字
 */
@property (strong, nonatomic) HJBadgeView *bageView;

@end
@implementation HJTableViewCell

#pragma mark - 懒加载
- (UIImageView *)rightArrow
{
    if (_rightArrow == nil) {
        self.rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
    }
    return _rightArrow;
}

- (UISwitch *)rightSwitch
{
    if (_rightSwitch == nil) {
        self.rightSwitch = [[UISwitch alloc] init];
    }
    return _rightSwitch;
}

- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.textColor = [UIColor lightGrayColor];
        self.rightLabel.font = [UIFont systemFontOfSize:13];
    }
    return _rightLabel;
}

- (HJBadgeView *)bageView{
    if (_bageView == nil) {
        self.bageView = [[HJBadgeView alloc]init];
    }
    return _bageView;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}
- (void)setupCell{
    //设置标题的字体
    self.textLabel.font = [UIFont boldSystemFontOfSize:15];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //调整子标题的  x
    self.detailTextLabel.left = CGRectGetMaxX(self.textLabel.frame) + 10;
}
//方法1
//- (void)setFrame:(CGRect)frame{
//    frame.origin.y -= 20;
//    
//    [super setFrame:frame];
//}

- (void)setItem:(HJCommomItem *)item{
    
    _item = item;
    
    //设置基本数据
    self.imageView.image = [UIImage imageWithName:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    //2.设置 右边内容
    if (item.badgeValue) {// 当有消息数量的时候
        self.bageView.badgeValue = item.badgeValue;
        self.accessoryView = self.bageView;
    }else if ([item isKindOfClass:[HJCommonArrow class]]) {
        self.accessoryView = self.rightArrow;
    }else if ([item isKindOfClass:[HJCommonSwitch class]]){
        self.accessoryView = self.rightSwitch;
    }else if([item isKindOfClass:[HJCommonLabel class]]){
        //错误的写法
//        HJCommonLabel *label = [[HJCommonLabel alloc]init];
        
        
        //正确的写法
        HJCommonLabel *label = (HJCommonLabel *)item;
        self.rightLabel.text = label.text;
        //根据文字计算尺寸
        self.rightLabel.size = [label.text sizeWithFont:self.rightLabel.font];
        
        self.accessoryView = self.rightLabel;
        
    }else{//cell 加载的时候避免 重用 显示
        self.accessoryView = nil;
    }
    
    
    
    
    
}

- (void)setIndexpaath:(NSIndexPath *)indexPath rowsInSection:(int)rows{

    UIImageView *bgImage = [[UIImageView alloc]init];
    UIImageView *selectedBgImage = [[UIImageView alloc]init];
    if (rows == 1) {
        bgImage.image = [UIImage resizedImage:@"common_card_background"];
        selectedBgImage.image = [UIImage resizedImage:@"common_card_background_highlighted"];
    }else if (indexPath.row == 0){
        //首行
        bgImage.image = [UIImage resizedImage:@"common_card_top_background"];
        selectedBgImage.image = [UIImage resizedImage:@"common_card_top_background_highlighted"];
    }else if (indexPath.row == rows - 1){
        //末行
        bgImage.image = [UIImage resizedImage:@"common_card_bottom_background"];
        selectedBgImage.image = [UIImage resizedImage:@"common_card_bottom_background_highlighted"];
    }else{
        //中间
        bgImage.image = [UIImage resizedImage:@"common_card_middle_background"];
        selectedBgImage.image = [UIImage resizedImage:@"common_card_middle_background_highlighted"];
    }
    
    
    self.selectedBackgroundView = selectedBgImage;
    self.backgroundView = bgImage;
    
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
