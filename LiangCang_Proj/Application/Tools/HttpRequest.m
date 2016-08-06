//
//  HttpRequest.m
//  LiangCang_Proj
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking.h>

@implementation HttpRequest

+ (void)get:(NSString *)url parameter:(NSDictionary *)parameter returnBlock:(void (^)(NSData *, NSError *))result
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        // 下载进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 调用Block
        result(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        result(nil,error);
    }];
}

@end
