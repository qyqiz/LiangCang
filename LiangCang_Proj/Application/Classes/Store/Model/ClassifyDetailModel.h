//
//  ClassifyDetailModel.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol DetailMetaModel <NSObject>

@end

@protocol DetailDataModel <NSObject>

@end

@protocol DetailItemModel <NSObject>

@end

@protocol DetailBrand_InfoModel <NSObject>

@end

@class DetailMetaModel,DetailDataModel,DetailItemModel,DetailBrand_InfoModel;

@interface ClassifyDetailModel : JSONModel

@property (nonatomic, strong) DetailMetaModel <DetailMetaModel, Optional>*meta;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) DetailDataModel <DetailDataModel, Optional>*data;

@end

@interface DetailMetaModel : JSONModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *errdata;

@property (nonatomic, copy) NSString *errmsg;

@property (nonatomic, assign) NSInteger account_id;

@property (nonatomic, assign) CGFloat cost;

@property (nonatomic, copy) NSString *server_time;

@end

@interface DetailDataModel : JSONModel

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, copy) NSString *num_items;

@property (nonatomic, strong) NSArray<DetailItemModel> *items;

@end

@interface DetailItemModel : JSONModel

@property (nonatomic, copy) NSString *goods_name;

@property (nonatomic, copy) NSString *comment_count;

@property (nonatomic, assign) NSInteger is_gift;

@property (nonatomic, copy) NSString *goods_image;

@property (nonatomic, copy) NSString *goods_url;

@property (nonatomic, copy) NSString *discount_price;

@property (nonatomic, copy) NSString *promotion_imgurl;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *owner_id;

@property (nonatomic, copy) NSString *sale_by;

@property (nonatomic, copy) NSString *like_count;

@property (nonatomic, copy) NSString *goods_id;

@property (nonatomic, strong) DetailBrand_InfoModel <DetailBrand_InfoModel, Optional>*brand_info;

@property (nonatomic, copy) NSString *liked;

@property (nonatomic, copy) NSString *coupon_flag;

@end

@interface DetailBrand_InfoModel : JSONModel

@property (nonatomic, copy) NSString *brand_id;

@property (nonatomic, copy) NSString *brand_name;

@property (nonatomic, copy) NSString *brand_desc;

@property (nonatomic, copy) NSString *brand_logo;

@end

