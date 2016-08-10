//
//  ClassifyInfoScrollTableViewCell.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/10.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyInfoModel.h"

@interface ClassifyInfoScrollTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

- (void)sendDataToModel:(ClassifyInfoModel *)model;

@end
