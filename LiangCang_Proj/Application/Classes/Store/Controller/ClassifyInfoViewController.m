//
//  ClassifyInfoViewController.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/10.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyInfoViewController.h"
#import "ClassifyInfoScrollTableViewCell.h"
#import "ClassifyInfoModel.h"
#import "HttpRequest.h"
#import "StoreMacro.h"

#import <UIKit+AFNetworking.h>

@interface ClassifyInfoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) ClassifyInfoModel *model;

@end

@implementation ClassifyInfoViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self loadData];
//    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init Data
- (void)initData {
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
}

#pragma mark - Load Data
- (void)loadData {
    NSString *url = [NSString stringWithFormat:CLASSIFY_INFO_URL, _goodId];
    [HttpRequest get:url parameter:nil returnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            // Data analysis
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.model = [[ClassifyInfoModel alloc]initWithDictionary:dict error:nil];
            [self createUI];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Create UI
- (void)createUI {
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Create scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    NSArray *imageArr = self.model.data.items.images_item;
    scrollView.contentSize = CGSizeMake(WIDTH * imageArr.count, 300);
    for (int i = 0; i < imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * WIDTH, 0, WIDTH, 300)];
        [imageView setImageWithURL:[NSURL URLWithString:imageArr[i]]];
        [scrollView addSubview:imageView];
    }
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    
    // Create titleLabel
    UILabel *titleLabel = [self createLabelWithFrame:CGRectMake(15, scrollView.frame.size.height + 15, 200, 17) andText:self.model.data.items.brand_info.brand_name andTextColor:[UIColor grayColor]];
    [self.view addSubview:titleLabel];
    
    // Create detailLabel
    UILabel *detailLabel = [self createLabelWithFrame:CGRectMake(15, titleLabel.frame.origin.y + 30, 200, 13) andText:self.model.data.items.goods_name andTextColor:[UIColor grayColor]];
    detailLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:detailLabel];
    
    // Create likeButton
    UIButton *likeButton = [self createButtonWithFrame:CGRectMake(WIDTH - 30, titleLabel.frame.origin.y, 15, 15) andNormalImage:@"商品收藏未选~iphone" andSelectedImage:@"商品收藏选中~iphone"];
    // TODO: likeButtonTarget
    [self.view addSubview:likeButton];
    
    // Create likeCount
    // ???: did not
    UILabel *likeLabel = [self createLabelWithFrame:CGRectMake(0, 0, 30, 13) andText:self.model.data.items.like_count andTextColor:[UIColor grayColor]];
    likeLabel.center = CGPointMake(likeButton.center.x, likeButton.center.y + 20);
    likeLabel.text = self.model.data.items.like_count;
    likeLabel.font = [UIFont systemFontOfSize:13];
    likeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:likeLabel];
    
    // Create share button
    UIButton *shareButton = [self createButtonWithFrame:CGRectMake(WIDTH - 30, likeButton.frame.origin.y + 45, 15, 15) andNormalImage:@"更多分享~iphone" andSelectedImage:nil];
    // TODO: shareButtonTarget
    [self.view addSubview:shareButton];
    
    // Create priceLabel
    NSString *str = [NSString stringWithFormat:@"¥%@",self.model.data.items.price];
    UILabel *priceLabel = [self createLabelWithFrame:CGRectMake(detailLabel.frame.origin.x, detailLabel.frame.origin.y + 60, 150, 16) andText:str andTextColor:[UIColor cyanColor]];
    [self.view addSubview:priceLabel];
}

#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassifyInfoScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClassifyInfoScrollTableViewCell" forIndexPath:indexPath];
    [cell sendDataToModel:_dataArray[indexPath.row]];
    return cell;
}

#pragma mark - Tools
- (UIButton *)createButtonWithFrame:(CGRect)frame andNormalImage:(NSString *)normalImage andSelectedImage:(NSString *)selectedImage {
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    return button;
}

- (UILabel *)createLabelWithFrame:(CGRect)frame andText:(NSString *)text andTextColor:(UIColor *)color {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    return label;
}

@end












