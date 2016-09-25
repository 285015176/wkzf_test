//
//  WYTopView.h
//  wkzf
//
//  Created by 魏欣 on 16/9/25.
//  Copyright © 2016年 魏欣. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WYTopViewDelegate<NSObject>
- (void)cilick;
@end

@interface WYTopView : UIView
- (void)offsetY:(CGFloat)offset;
@property(nonatomic,copy)void(^clickBlok)();
@property(nonatomic,weak)id<WYTopViewDelegate> delegate;

@end
