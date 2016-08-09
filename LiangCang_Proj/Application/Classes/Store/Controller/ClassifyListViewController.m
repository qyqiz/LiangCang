//
//  ClassifyListViewController.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/8.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyListViewController.h"
#import "ClassifyDetailCollectionViewCell.h"
#import "ClassifyDetailModel.h"
#import "HttpRequest.h"
#import "StoreMacro.h"

@interface ClassifyListViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSArray *priceFilter;

@property (nonatomic, assign) BOOL flag;

@property (nonatomic, assign) int page;

@end

@implementation ClassifyListViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor redColor];
    [self initData];
    [self loadData];
    [self createCollectionView];
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init Data
- (void)initData {
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    _priceFilter = @[@"全部",@"0-200",@"201-500",@"501-1000",@"1001-3000",@"3000以上"];
    _flag = YES;
    _page = 1;
}

#pragma mark - Load Data
- (void)loadData {
    NSString *urlStr = [NSString stringWithFormat:CLSSIFY_DETAIL_URL,self.page,_catid];
    [HttpRequest get:urlStr parameter:nil returnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            // Data analysis
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            for (NSDictionary *itemModel in dict[@"data"][@"items"]) {
                DetailItemModel *model = [[DetailItemModel alloc]initWithDictionary:itemModel error:nil];
                [_dataArray addObject:model];
//                NSLog(@"%@",_dataArray);
            }
            [_collectionView reloadData];
        } else {
            // Print the error description.
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

#pragma mark - Create UI
- (void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TABBAR_HEIGHT + 16, WIDTH, PRICE_HEADER_HEIGHT) style:UITableViewStylePlain];
    _tableView.bounces = NO;
    _tableView.scrollEnabled = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.view bringSubviewToFront:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(WIDTH / 2, 300);
    // Set item spacing
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    // Create CollectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, TABBAR_HEIGHT + 16 + _tableView.frame.size.height, WIDTH, HEIGHT - TABBAR_HEIGHT + 16 + _tableView.frame.size.height) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ClassifyDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ClassifyDetailCollectionViewCell"];
}

#pragma mark - CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ClassifyDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassifyDetailCollectionViewCell" forIndexPath:indexPath];
    [cell sendDataToModel:_dataArray[indexPath.item]];
    return cell;
}

#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_flag == NO) {
        return _priceFilter.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = _priceFilter[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return PRICE_HEADER_HEIGHT;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH - 100, PRICE_HEADER_HEIGHT)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH, 15)];
    label.center = CGPointMake(label.center.x, view.center.y);
    label.text = @"价格筛选";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor darkGrayColor];
    [view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 27, 15)];
    imageView.center = CGPointMake(WIDTH - 30, label.center.y);
    imageView.image = [UIImage imageNamed:@"选择价格向下箭头~iphone"];
    [view addSubview:imageView];
    
    UIButton *buttonClick = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, PRICE_HEADER_HEIGHT)];
    buttonClick.backgroundColor = [UIColor clearColor];
    [buttonClick addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:buttonClick];
    return view;
}

#pragma mark - Actions
- (void)buttonClick:(UIButton *)button {
    [UIView animateWithDuration:0.3 animations:^{
        if (_flag == YES) {
            _tableView.frame = CGRectMake(0, TABBAR_HEIGHT + 16, WIDTH, PRICE_FILTER_HEIGHT);
            _flag = NO;
        } else {
            _tableView.frame = CGRectMake(0, TABBAR_HEIGHT + 16, WIDTH, PRICE_HEADER_HEIGHT);
            _flag = YES;
        }
        // Reload the section with animation.
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:0];
        [_tableView reloadSections:indexSet withRowAnimation:NO];
    }];
}

@end















