//
//  StoreTabBaseViewController.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/1.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyViewController.h"
#import "StoreClassifyTableViewCell.h"
#import "ClassifyListViewController.h"
#import "StoreMacro.h"
#import "HttpRequest.h"
#import "ClassifyModel.h"

#import <UIKit+AFNetworking.h>

@interface ClassifyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

// TableView header images.
@property (nonatomic, strong) NSMutableArray *coverImgDataArr;

@property (nonatomic, strong) NSMutableArray *dataArray;

// TableView header close and open.
@property (nonatomic, strong) NSMutableArray *flags;

@end

@implementation ClassifyViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initData];
    [self createTabeView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init Data
- (void)initData {
    _coverImgDataArr = [[NSMutableArray alloc]initWithCapacity:0];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    _flags = [[NSMutableArray alloc]initWithCapacity:0];
}

#pragma mark - Load Data
- (void)loadData
{
    [HttpRequest get:CLASSIFY_URL parameter:nil returnBlock:^(NSData *data, NSError *error) {
        if (!error)
        {
            // Data analysis
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            for (NSDictionary *itemDict in dict[@"data"][@"items"]) {
                ItemsModel *itemModel = [[ItemsModel alloc]init];
                itemModel.cover_img = itemDict[@"cover_img"];
                [_coverImgDataArr addObject:itemModel];
                NSMutableArray *rowArray = [[NSMutableArray alloc]initWithCapacity:0];
                for (NSDictionary *itemSecondDict in itemDict[@"second"][0]) {
                    ItemsModel *itemSecondModel = [[ItemsModel alloc]init];
                    itemSecondModel.cat_name = itemSecondDict[@"cat_name"];
                    [rowArray addObject:itemSecondModel];
                }
                
                //_flags array is the TableView (close & open) flag.
                [_flags addObject:@NO];
                [_dataArray addObject:rowArray];
            }
            [_tableView reloadData];
        }
        else
        {
            // Print the error description.
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

#pragma mark - Create The TableView
- (void)createTabeView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STORE_TABBAR_HEIGHT, WIDTH, HEIGHT - 2 * STORE_TABBAR_HEIGHT - TABBAR_HEIGHT - 27) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // Register new cell
    [_tableView registerNib:[UINib nibWithNibName:@"StoreClassifyTableViewCell" bundle:nil] forCellReuseIdentifier:@"StoreClassifyTableViewCell"];
}

#pragma mark - TableView Delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, CELL_HEIGHT)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, CELL_HEIGHT)];
    ItemsModel *model = _coverImgDataArr[section];
    [imageView setImageWithURL:[NSURL URLWithString:model.cover_img] placeholderImage:nil];
    [view addSubview:imageView];
    
    UIButton *button = [self createButton];
    button.tag = 200 + section;
    [view addSubview:button];
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CELL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BOOL value = [[_flags objectAtIndex:section] boolValue];
    if (value == NO) {
        return 0;
    }
    return [_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreClassifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreClassifyTableViewCell"];
    [cell sendDataToModel:_dataArray[indexPath.section][indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ClassifyListViewController *detailView = [[ClassifyListViewController alloc]init];
    [self.navigationController pushViewController:detailView animated:YES];
}

#pragma mark - Tools
- (UIButton *)createButton
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, CELL_HEIGHT)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - Actions
- (void)buttonClick:(UIButton *)button
{
    NSInteger index = button.tag - 200;
    BOOL flag = [_flags[index] boolValue];
    
    if (flag == YES) {
        flag = NO;
    } else {
        flag = YES;
    }
    
    [_flags removeObjectAtIndex:index];
    [_flags insertObject:@(flag) atIndex:index];
    
    
    // Reload the section with animation.
    NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:index];
    [_tableView reloadSections:indexSet withRowAnimation:NO];
}


@end
