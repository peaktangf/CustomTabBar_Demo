//
//  CustomTabBarController.m
//  CustomTabBar_Demo
//
//  Created by 谭高丰 on 2017/5/31.
//  Copyright © 2017年 谭高丰. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "CustomTabBar.h"

@interface CustomTabBarController ()<UITabBarControllerDelegate>

@end

@implementation CustomTabBarController

/*
 // 1、Method one：直接设置tabBarItem的图片渲染模式
 
 该方式，按钮超出tabBar范围的部分不能相应点击
 - (void)viewDidLoad {
 [super viewDidLoad];
 [self configureChildVC];
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
    [self configureChildVC];
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


// 3、Method three：自定义tabBar，以KVC的方式替换系统的tabBar
 
// 该方式，按钮超出tabBar范围的部分可以相应点击
- (void)viewDidLoad {
    [self configureChildVC];
    CustomTabBar *tabbar = [[CustomTabBar alloc] init];
    [tabbar setCenterBtnSize:CGSizeMake(136, 53) center:CGPointMake(kSCREEN_W/2, 22) image:IMG(@"add_icon")];
    tabbar.centerClick = ^{
        NSLog(@"点击了");
    };
    [self setValue:tabbar forKey:@"tabBar"];
}
 

#pragma mark - setup

- (void)configureChildVC {
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [self setupOneChildVcWithVc:homeVc image:@"tabBar_home" selectedImage:@"tabBar_home" title:@"首页"];
    UIViewController *centerVc = [[UIViewController alloc] init];
    [self setupOneChildVcWithVc:centerVc image:nil selectedImage:nil title:@""];
    NewsViewController *newsVc = [[NewsViewController alloc] init];
    [self setupOneChildVcWithVc:newsVc image:@"tabBar_news" selectedImage:@"tabBar_news" title:@"新闻"];
}

- (void)setupOneChildVcWithVc:(UIViewController *)Vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:Vc];
    
    Vc.tabBarItem.image = IMG(image);
    Vc.tabBarItem.selectedImage = IMG(selectedImage);
    Vc.tabBarItem.title = title;
    Vc.title = title;
    
    [self addChildViewController:navVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
