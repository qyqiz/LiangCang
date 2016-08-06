//
//  StoreClassifyTableViewCell.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "StoreClassifyTableViewCell.h"
#import "ClassifyModel.h"

@implementation StoreClassifyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)sendDataToModel:(ItemsModel *)model {
    _titleLabel.text = model.cat_name;
}

@end
