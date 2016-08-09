//
//  ClassifyDetailCollectionViewCell.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyDetailCollectionViewCell.h"
#import <UIKit+AFNetworking.h>

@implementation ClassifyDetailCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)sendDataToModel:(DetailItemModel *)model {
    [_mainImage setImageWithURL:[NSURL URLWithString:model.goods_image]];
    _titleLabel.text = model.brand_info.brand_name;
    _detailLabel.text = model.brand_info.brand_desc;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    _likeLabel.text = model.like_count;
}

@end
