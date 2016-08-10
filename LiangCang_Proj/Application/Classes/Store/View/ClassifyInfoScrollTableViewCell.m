//
//  ClassifyInfoScrollTableViewCell.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/10.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyInfoScrollTableViewCell.h"
#import <UIKit+AFNetworking.h>

@implementation ClassifyInfoScrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)sendDataToModel:(ClassifyInfoModel *)model {
    NSArray *imageArr = model.data.items.images_item;
    _scrollView.contentSize = CGSizeMake(WIDTH * imageArr.count, self.contentView.frame.size.height);
    for (int i = 0; i < imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * WIDTH, 0, WIDTH, self.contentView.frame.size.height)];
        [imageView setImageWithURL:[NSURL URLWithString:imageArr[i]]];
        [_scrollView addSubview:imageView];
    }
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    
    _titleLabel.text = model.data.items.brand_info.brand_name;
    _detailLabel.text = model.data.items.goods_name;
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",model.data.items.price];
    _likeLabel.text = model.data.items.like_count;
}

@end
