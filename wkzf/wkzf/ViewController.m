//
//  ViewController.m
//  wkzf
//
//  Created by 魏欣 on 16/9/24.
//  Copyright © 2016年 魏欣. All rights reserved.
//

#import "ViewController.h"
#import "Commons.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController {
    UIView * _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//     tableView.rowHeight = 49;
     tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
     tableView.dataSource = self;
     tableView.delegate = self;
     tableView.showsVerticalScrollIndicator = NO;
     tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
     tableView.bounces = YES;
    tableView.backgroundColor = kHRGB(0XF5F5F5);
    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth , kSizeScaleiphone6Width(250))];
    tableHeadView.backgroundColor = [UIColor redColor];
    tableView.tableHeaderView = tableHeadView;
    
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];


    // Do any additional setup after loading the view, typically from a nib.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else if (section == 1) {
        return 10;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;
}
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

//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

        return cell;
    }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 0){
        return 4;
    }else{
        return 3;
    }
}
@end
