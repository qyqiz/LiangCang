//
//  AppDelegate.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/7/29.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "AppDelegate.h"
#import "StoreViewController.h"
#import "MagazineViewController.h"
#import "ExpertViewController.h"
#import "ShareViewController.h"
#import "IndividualViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
     *  改变StatusBar样式
     *
     *  UIStatusBarStyleDefault       默认为黑色
     *  UIStatusBarStyleLightContent
     *
     */
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window                 = [[UIWindow alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NSArray *tabNames           = @[@"商店",@"杂志",@"达人",@"分享",@"个人"];
    NSArray *normalImageNames   = @[@"商店未选中~iphone",@"杂志未选中~iphone",@"达人未选中~iphone",@"分享未选中~iphone",@"个人未选中~iphone"];
    NSArray *selectedImageNames = @[@"商店选中~iphone",@"杂志选中~iphone",@"达人选中~iphone",@"分享选中~iphone",@"个人选中~iphone"];
    NSArray *classes            = @[[StoreViewController class],[MagazineViewController class],[ExpertViewController class],[ShareViewController class],[IndividualViewController class]];

    NSMutableArray *mArr        = [NSMutableArray array];
    for (int i = 0; i < tabNames.count; i++)
    {
        UIViewController *VC = [self viewControllerWithTitle:tabNames[i] andClass:classes[i] andNormalImage:normalImageNames[i] andSelectedImage:selectedImageNames[i]];
        [mArr addObject:VC];
    }
    UITabBarController *tabC       = [[UITabBarController alloc]init];
    tabC.viewControllers           = mArr;

    self.window.rootViewController = tabC;
    tabC.tabBar.barTintColor       = [UIColor blackColor];
    return YES;
}

#pragma mark 创建ViewController的方法
/**
 *  创建ViewController的方法
 *
 *  @param title             标题
 *  @param cls               创建的ViewController的方法
 *  @param normalImageName   正常图标图片
 *  @param selectedImageName 选取图标的颜色
 *
 *  @return 返回为ViewController
 */
- (UIViewController *)viewControllerWithTitle:(NSString *)title andClass:(Class)cls andNormalImage:(NSString *)normalImageName andSelectedImage:(NSString *)selectedImageName
{
    UIViewController *VC        = [[cls alloc]init];
    VC.title                    = title;

    VC.tabBarItem               = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalImageName] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    VC.tabBarItem.imageInsets   = UIEdgeInsetsMake(7, 0, -7, 0);

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
    
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    return nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
