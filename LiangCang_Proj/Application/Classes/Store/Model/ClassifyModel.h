//
//  ClassifyModel.h
//  YYModelDemo
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 祁喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel.h>

@protocol MetaModel <NSObject>

@end

@protocol DataModel <NSObject>

@end

@protocol ItemsModel <NSObject>

@end

@class MetaModel,DataModel,ItemsModel;
@interface ClassifyModel : JSONModel

@property (nonatomic, strong) MetaModel<MetaModel,Optional>*meta;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) DataModel<DataModel,Optional>*data;

@end

@interface MetaModel : JSONModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *errdata;

@property (nonatomic, copy) NSString *errmsg;

@property (nonatomic, assign) NSInteger account_id;

@property (nonatomic, assign) CGFloat cost;

@property (nonatomic, copy) NSString *server_time;

@end

@interface DataModel : JSONModel

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger num_items;

@property (nonatomic, strong) NSArray<ItemsModel>*items;

@end

@interface ItemsModel : JSONModel

@property (nonatomic, copy) NSString *cat_name;

@property (nonatomic, copy) NSString *cover_img;
//
@property (nonatomic, copy) NSString *my_new_cover_img;

@property (nonatomic, copy) NSString *cat_id;

@property (nonatomic, copy) NSString *cover_new_img;

@property (nonatomic, strong) NSArray *second;

@end

