//
//  ClassifyDetailCollectionViewCell.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyDetailModel.h"

@interface ClassifyDetailCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

- (void)sendDataToModel:(DetailItemModel *)model;

@end
