//
//  StoreViewController.h
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#ifndef StoreMacro_h
#define StoreMacro_h

#import <MJRefresh.h>

#define STORE_TABBAR_HEIGHT 37.0f
#define CELL_HEIGHT         170.0f
#define PRICE_FILTER_HEIGHT 300.0f
#define PRICE_HEADER_HEIGHT 40.f

#define CLASSIFY_URL @"http://mobile.iliangcang.com/goods/goodsCategory?a=b&app_key=iPhone&v=3.0.0&sig=D1A042C4-40B2-43A7-A1AD-8AD9EEE8BB04"

#define CLASSIFY_DETAIL_URL @"http://mobile.iliangcang.com/goods/goodsShare?a=b&page=%d&count=10&cat_code=%@&coverId=1&app_key=iPhone&v=3.0.0&sig=D1A042C4-40B2-43A7-A1AD-8AD9EEE8BB04"

#define CLASSIFY_INFO_URL @"http://mobile.iliangcang.com/goods/goodsDetail/?uid=944103872&goods_id=%@&app_key=iPhone&v=3.0.0&sig=D1A042C4-40B2-43A7-A1AD-8AD9EEE8BB04&user_token=ab2a170e0144aac590a457cba42195a8"

#endif /* StoreMacro_h */
