//
//  WYTopView.m
//  wkzf
//
//  Created by 魏欣 on 16/9/25.
//  Copyright © 2016年 魏欣. All rights reserved.
//

#import "WYTopView.h"
#import "Commons.h"

@implementation WYTopView {
    UIImageView *_bgImageView;
    UIImageView *_logoImageView;
    UIButton *_button;
    CGFloat _originalHeight;
}
//初始化子控件
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _originalHeight = frame.size.height;
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"login"];
        _bgImageView.layer.anchorPoint = CGPointMake(0.5, 0);
        _bgImageView.frame = self.frame;
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.image = [UIImage imageNamed:@"my-header"];
        _logoImageView.layer.anchorPoint = CGPointMake(0.5, 0);//重新设置锚点
        _logoImageView.frame = CGRectMake(0, kSizeScaleiphone6Width(60), kSizeScaleiphone6Width(152), kSizeScaleiphone6Width(67));
        CGPoint center =  _logoImageView.center;
        center.x = self.frame.size.width / 2;
        _logoImageView.center = center;
        _button = [[UIButton alloc] init];
        _button.frame = CGRectMake(0, kSizeScaleiphone6Width(161), kSizeScaleiphone6Width(114), kSizeScaleiphone6Width(44));
        center = _button.center;
        center.x = self.frame.size.width / 2;
        _button.center = center;
        _button.layer.borderWidth = 1;
        _button.layer.borderColor = [UIColor whiteColor].CGColor;
        _button.layer.cornerRadius = CGRectGetHeight(_button.frame) / 2;
        [_button setTitle:@"登录" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:kSizeScaleiphone6Width(16)];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgImageView];
        [self addSubview:_logoImageView];
        [self addSubview:_button];
    }
    return self;
}
- (void)clickButton {
    NSLog(@"clickButton");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonClick" object:nil];
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(cilick)]){
             [self.delegate cilick];
        }
    }
    if(self.clickBlok){
        self.clickBlok();
    }
}
//自定义方法设置缩放
- (void)offsetY:(CGFloat)offset {
    CGRect frame = self.frame;
    frame.size.height = _originalHeight +offset;
    self.frame = frame;
    frame = _button.frame;
    frame.origin.y = kSizeScaleiphone6Width(161)+offset;
    _button.frame = frame;
    CGFloat scale = (_originalHeight +offset)/_originalHeight;
    _bgImageView.transform = CGAffineTransformMakeScale(scale, scale);
    _logoImageView.transform = CGAffineTransformMakeScale(scale, scale);
}
@end
