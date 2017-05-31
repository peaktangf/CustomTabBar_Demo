//
//  CustomTabBar.m
//  CustomTabBar_Demo
//
//  Created by 谭高丰 on 2017/5/31.
//  Copyright © 2017年 谭高丰. All rights reserved.
//

#import "CustomTabBar.h"
#import "UIView+HKExtension.h"

@interface CustomTabBar ()
/** 中间按钮 */
@property (nonatomic, weak) UIButton *centerBtn;
@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *centerBtn = [[UIButton alloc] init];
        [centerBtn addTarget:self action:@selector(centerBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        self.centerBtn = centerBtn;
        [self addSubview:centerBtn];
    }
    return self;
}

- (void)setCenterBtnSize:(CGSize)size center:(CGPoint)center image:(UIImage *)image {
    [self.centerBtn setBackgroundImage:image forState:UIControlStateNormal];
    self.centerBtn.frame = CGRectMake(0, 0, size.width, size.height);
    self.centerBtn.center = center;
}

#pragma mark - Btn Click
- (void)centerBtnDidClick {
    if (self.centerClick) {
        self.centerClick();
    }
}

//重写hitTest方法，去监听中间按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断当前手指是否点击到中间按钮上，如果是，则响应按钮点击，其他则系统处理
    //首先判断当前View是否被隐藏了，隐藏了就不需要处理了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到中间按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.centerBtn];
        
        //判断如果这个新的点是在中间按钮身上，那么处理点击事件最合适的view就是中间按钮
        if ( [self.centerBtn pointInside:newP withEvent:event]) {
            return self.centerBtn;
        }
    }
    return [super hitTest:point withEvent:event];
}

@end
