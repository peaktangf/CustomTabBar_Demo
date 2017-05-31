//
//  CustomTabBar.h
//  CustomTabBar_Demo
//
//  Created by 谭高丰 on 2017/5/31.
//  Copyright © 2017年 谭高丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBar : UITabBar

@property (nonatomic, copy) void(^centerClick)(void);
- (void)setCenterBtnSize:(CGSize)size center:(CGPoint)center image:(UIImage *)image;

@end
