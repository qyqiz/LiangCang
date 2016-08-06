//
//  StoreClassifyTableViewCell.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyModel.h"

@interface StoreClassifyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)sendDataToModel:(ItemsModel *)model;

@end
