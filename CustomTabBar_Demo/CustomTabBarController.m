//
//  CustomTabBarController.m
//  CustomTabBar_Demo
//
//  Created by 谭高丰 on 2017/5/31.
//  Copyright © 2017年 谭高丰. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBar.h"

#define kSCREEN_H [UIScreen mainScreen].bounds.size.height
#define kSCREEN_W [UIScreen mainScreen].bounds.size.width
#define IMG(imageName) [UIImage imageNamed:imageName]

@interface CustomTabBarController ()<UITabBarControllerDelegate>

@end

@implementation CustomTabBarController

/*
 // 1、Method one：直接设置tabBarItem的图片渲染模式
 
 该方式，按钮超出tabBar范围的部分不能相应点击
 - (void)viewDidLoad {
 [super viewDidLoad];
 self.delegate = self;
 //设置中间item的image样式，并设置其渲染模式为原始状态（不使用tint color）
 UITabBarItem *item = [self.tabBar.items objectAtIndex:1];
 item.image = [[UIImage imageNamed:@"add_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 [item setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
 }
 
 #pragma mark - UITabBarControllerDelegate
 // 拦截中间item的点击事件
 - (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
 NSLog(@"点击了");
 return YES;
 }
 */



/*
 // 2、Method two：创建一个按钮直接添加到系统的tabBar上
 
 该方式，按钮超出tabBar范围的部分不能相应点击
- (void)viewDidLoad {
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 136, 53)];
    button.center = CGPointMake(kSCREEN_W/2, 22);
    [button setBackgroundImage:IMG(@"add_icon") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button];
}

- (void)addAction {
    NSLog(@"点击了");
}
*/



/*
// 3、Method three：自定义tabBar，以KVC的方式替换系统的tabBar
 
 该方式，按钮超出tabBar范围的部分可以相应点击
- (void)viewDidLoad {
    CustomTabBar *tabbar = [[CustomTabBar alloc] init];
    tabbar.centerClick = ^{
        NSLog(@"点击了");
    };
    [self setValue:tabbar forKey:@"tabBar"];
}
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
