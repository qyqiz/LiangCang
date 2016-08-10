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

@interface ClassifyInfoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ClassifyInfoViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self loadData];
    [self createUI];
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
            ClassifyInfoModel *model = [[ClassifyInfoModel alloc]initWithDictionary:dict error:nil];
            [_dataArray addObject:model];
            NSLog(@"%@",model.data.items.images_item);
            [_tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Create UI
- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ClassifyInfoScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClassifyInfoScrollTableViewCell"];
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

@end
