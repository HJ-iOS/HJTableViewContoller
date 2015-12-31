//
//  HJCommonViewController.m
//  建立该模型的父类 所有分区的子类都继承于他
//
//  Created by admin on 15/12/29.
//  Copyright (c) 2015年 HJ. All rights reserved.
//

#import "HJCommonViewController.h"
#import "HJCommomItem.h"
#import "HJCommonGroup.h"
#import "HJTableViewCell.h"

@interface HJCommonViewController ()

@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation HJCommonViewController
//数组懒加载
-(NSMutableArray *)groups{
    if (_groups == nil) {
        self.groups = [NSMutableArray array];
    }
    return _groups;
}
//屏蔽tableview的样式
- (id)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.backgroundColor = HJColor(211, 211, 211);
    //方法2
    //contentInset 增加额外的滚动区域(上下左右)
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.sectionFooterHeight = HMStatusCellMargin;
    self.tableView.sectionHeaderHeight = 0;
    
}
////每个section下面的标语内容
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    HJCommonGroup *group = self.groups[section];
    return group.footer;
}
////每个section上面的标语内容
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    HJCommonGroup *group = self.groups[section];
    return group.header;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HJCommonGroup *lol = self.groups[section];
    return lol.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *str = @"HJ";
    HJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil){
        cell = [[HJTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    
    HJCommonGroup *lol = self.groups[indexPath.section];
    cell.item = lol.items[indexPath.row];
    [cell setIndexpaath:indexPath rowsInSection:lol.items.count];
    return cell;
}
#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出这行对应的item模型
    HJCommonGroup *lol = self.groups[indexPath.section];
    HJCommomItem *item = lol.items[indexPath.row];
    
    //判断有无需要跳转的控制器
    if (item.destVcClass) {
        UIViewController *testVC = [[item.destVcClass alloc]init];
        testVC.title = item.title;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    
    //判断有无想执行的操作
    if (item.operation) {
        item.operation();
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
