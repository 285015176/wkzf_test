//
//  ViewController.m
//  wkzf
//
//  Created by 魏欣 on 16/9/24.
//  Copyright © 2016年 魏欣. All rights reserved.
//

#import "ViewController.h"
#import "Commons.h"
#import "WYTopView.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WYTopViewDelegate>

@end

@implementation ViewController {
    WYTopView *_topView;
    UITableView *_tableView;
    CGFloat _topHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _topHeight = kSizeScaleiphone6Width(250);
    //创建一个空VIEW
    UIView * emptyView = [[UIView alloc] init];
    [self.view addSubview:emptyView];
    [self.navigationController setNavigationBarHidden:YES];
    //创建tableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//     tableView.rowHeight = 49;
//     tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
     tableView.dataSource = self;
     tableView.delegate = self;
     tableView.showsVerticalScrollIndicator = NO;
     tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
     tableView.bounces = YES;
    tableView.backgroundColor = kHRGB(0XF5F5F5);
    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth , _topHeight)];
    tableHeadView.backgroundColor = [UIColor redColor];
    tableView.tableHeaderView = tableHeadView;
    [self.view addSubview:tableView];
    _tableView = tableView;
    _topView = [[WYTopView alloc] initWithFrame:tableHeadView.frame];
    [self.view addSubview:_topView];
    _topView.backgroundColor = [UIColor yellowColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:@"buttonClick" object:nil];
    _topView.delegate = self;
    __weak typeof(self) weekSelf = self;
    _topView.clickBlok = ^{
        [weekSelf cilickBlok];
    };
    
    

}
- (void)cilickBlok{
    NSLog(@"bolg");
}
- (void)cilick {
    NSLog(@"click");
}
- (void)login {
    NSLog(@"login");
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//设置导航栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
//间隙
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else if (section == 1) {
        return 10;
    }
    return 0;
}
//分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;
}
//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor = kHRGB(0X4E4E4E);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"menu-subscribe"];
            cell.textLabel.text = (@"我的收藏");
        }
        else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"wodejiaoyi"];
            cell.textLabel.text = (@"我的交易");
        }
        else if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"wodeqianbao"];
            cell.textLabel.text = (@"我的钱包");
        }
        else if (indexPath.row == 3) {
            cell.imageView.image = [UIImage imageNamed:@"wodeyouhuiquan"];
            cell.textLabel.text = (@"我的优惠券");
        }
    }
    else {
        if(indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"guanyuwomen"];
            cell.textLabel.text = (@"关于我们");
        }else if (indexPath.row == 1){
            cell.imageView.image = [UIImage imageNamed:@"yijianfankui"];
            cell.textLabel.text = (@"意见反馈");
        }else if (indexPath.row == 2){
            cell.imageView.image = [UIImage imageNamed:@"shezhi"];
            cell.textLabel.text = (@"设置");
        }
    }

        return cell;
    }
//分段
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 0){
        return 4;
    }else{
        return 3;
    }
}
//监听滑动

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    CGRect frame = _topView.frame;
    frame.origin.y = MIN(0, MAX(-(_topHeight - 20), -offset));
    _topView . frame = frame;
    if (offset < 0) {
        [_topView offsetY:-offset];
    }else {
        [_topView offsetY:0];
    }
}

@end
