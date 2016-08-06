//
//  ClassifyModel.m
//  YYModelDemo
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 祁喆. All rights reserved.
//

#import "ClassifyModel.h"

@implementation ClassifyModel


@end

@implementation MetaModel


@end

@implementation DataModel

+ (NSDictionary *)objcetClassInArray
{
    return @{@"items": [ItemsModel class]};
}
@end

@implementation ItemsModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"new_cover_img":@"my_new_cover_img"}];
}

@end
