//
//  ClassifyInfoModel.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/10.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ClassifyInfoDataModel <NSObject>

@end

@protocol ClassifyInfoItemModel <NSObject>

@end

@protocol ClassifyBrand_InfoModel <NSObject>

@end

@protocol ClassifyGood_GuideModel <NSObject>

@end

@protocol ClassifySku_InvModel <NSObject>

@end

@protocol ClassifySku_InfoModel <NSObject>

@end

@protocol ClassifyAttrlistModel <NSObject>

@end

@class ClassifyInfoDataModel,ClassifyInfoItemModel,ClassifyBrand_InfoModel,ClassifyGood_GuideModel,ClassifySku_InvModel,ClassifySku_InfoModel,ClassifyAttrlistModel;

@interface ClassifyInfoModel : JSONModel

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) ClassifyInfoDataModel <ClassifyInfoDataModel, Optional> *data;

@end

@interface ClassifyInfoDataModel : JSONModel

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger num_items;

@property (nonatomic, strong) ClassifyInfoItemModel <ClassifyInfoItemModel, Optional> *items;

@end

@interface ClassifyInfoItemModel : JSONModel

@property (nonatomic, copy) NSString *liked;

@property (nonatomic, copy) NSString *owner_id;

@property (nonatomic, copy) NSString *discount_price;

@property (nonatomic, copy) NSString *goods_image;

@property (nonatomic, copy) NSString *goods_name;

@property (nonatomic, copy) NSString *goods_desc;

@property (nonatomic, copy) NSString *like_count;

@property (nonatomic, copy) NSString *is_daren;

@property (nonatomic, strong) NSArray<ClassifySku_InfoModel> *sku_info;

@property (nonatomic, strong) ClassifyGood_GuideModel <ClassifyGood_GuideModel, Optional> *good_guide;

@property (nonatomic, strong) NSArray<NSString *> *images_item;

@property (nonatomic, copy) NSString *is_sold_out;

@property (nonatomic, strong) NSArray<ClassifySku_InvModel> *sku_inv;

@property (nonatomic, copy) NSString *owner_name;

@property (nonatomic, copy) NSString *owner_desc;

@property (nonatomic, copy) NSString *promotion_imgurl;

@property (nonatomic, copy) NSString *able_buy;

@property (nonatomic, copy) NSString *is_gift;

@property (nonatomic, copy) NSString *able_buy_note;

@property (nonatomic, copy) NSString *goods_id;

@property (nonatomic, copy) NSString *rec_reason;

@property (nonatomic, copy) NSString *good_ship_rule;

@property (nonatomic, strong) ClassifyBrand_InfoModel <ClassifyBrand_InfoModel, Optional> *brand_info;

@property (nonatomic, copy) NSString *sold_out_img_url;

@property (nonatomic, copy) NSString *goods_url;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *comment_count;

@property (nonatomic, copy) NSString *headimg;

@property (nonatomic, copy) NSString *category_id;

@end

@interface ClassifyBrand_InfoModel : JSONModel

@property (nonatomic, assign) NSInteger brand_id;

@property (nonatomic, copy) NSString *brand_name;

@property (nonatomic, copy) NSString *brand_desc;

@property (nonatomic, copy) NSString *brand_logo;

@end

@interface ClassifyGood_GuideModel : JSONModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@end

@interface ClassifySku_InvModel : JSONModel

@property (nonatomic, copy) NSString *amount;

@property (nonatomic, copy) NSString *attr_keys;

@property (nonatomic, copy) NSString *type_keys;

@property (nonatomic, copy) NSString *discount_price;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *goods_sku_sn;

@end

@interface ClassifySku_InfoModel : JSONModel

@property (nonatomic, strong) NSArray<ClassifyAttrlistModel> *attrList;

@property (nonatomic, copy) NSString *isColor;

@property (nonatomic, copy) NSString *type_id;

@property (nonatomic, copy) NSString *type_name;

@end

@interface ClassifyAttrlistModel : JSONModel

@property (nonatomic, copy) NSString *attr_id;

@property (nonatomic, copy) NSString *attr_name;

@property (nonatomic, copy) NSString *img_path;

@end

