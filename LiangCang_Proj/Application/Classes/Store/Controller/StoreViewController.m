//
//  StoreViewController.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/7/29.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "StoreViewController.h"

#import "ClassifyViewController.h"
#import "BrandViewController.h"
#import "HomeViewController.h"
#import "TopicViewController.h"
#import "GiftViewController.h"

@interface StoreViewController ()

@property (nonatomic, strong) SCNavTabBarController *tabBarController;

@end

@implementation StoreViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingNavigationBar];
    [self createTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
- (void)settingNavigationBar
{
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [leftButton addTarget:self action:@selector(leftBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[[UIImage imageNamed:@"搜索-图标~iphone"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightButton addTarget:self action:@selector(rightBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:[[UIImage imageNamed:@"购物车_图标~iphone"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)createTabBar
{
    ClassifyViewController *classify = [[ClassifyViewController alloc]init];
    classify.title = @"分类";
    BrandViewController *brand = [[BrandViewController alloc]init];
    brand.title = @"品牌";
    HomeViewController *home = [[HomeViewController alloc]init];
    home.title = @"首页";
    TopicViewController *topic = [[TopicViewController alloc]init];
    topic.title = @"专题";
    GiftViewController *gift = [[GiftViewController alloc]init];
    gift.title = @"礼物";
    
    // 创建TabBar, 高度为37.0f
    _tabBarController = [[SCNavTabBarController alloc]initWithSubViewControllers:@[classify,brand,home,topic,gift] andParentViewController:self showArrowButton:nil];
}

#pragma mark - Actions
- (void)leftBarButtonClick
{
    NSLog(@"搜索功能");
}

- (void)rightBarButtonClick
{
    NSLog(@"购物车功能");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
