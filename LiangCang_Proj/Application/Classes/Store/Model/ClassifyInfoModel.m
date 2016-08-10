//
//  ClassifyInfoModel.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/10.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ClassifyInfoModel.h"

@implementation ClassifyInfoModel

@end

@implementation ClassifyInfoDataModel

@end

@implementation ClassifyInfoItemModel

+ (NSDictionary *)objectClassInArray {
    return @{@"sku_info": [ClassifySku_InfoModel class], @"sku_inv": [ClassifySku_InvModel class]};
}

@end

@implementation ClassifyBrand_InfoModel

@end

@implementation ClassifyGood_GuideModel

@end


@implementation ClassifySku_InvModel

+ (NSDictionary *)objectClassInArray {
    return @{@"attrList": [ClassifyAttrlistModel class]};
}

@end


@implementation ClassifySku_InfoModel

@end


@implementation ClassifyAttrlistModel

@end


