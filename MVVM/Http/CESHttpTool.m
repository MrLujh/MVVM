//
//  CESHttpTool.m
//  CommunityService
//
//  Created by 家浩 on 2016/12/12.
//  Copyright © 2016年 卢家浩. All rights reserved.
//
//测试
#define SERVICE_INNER         @"http://139.217.11.18:81/O2OV2_test/user/index.php?" //测试

#import "CESHttpTool.h"

@implementation CESHttpTool

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    NSString  *urlStr = [SERVICE_INNER stringByAppendingFormat:@"%@&",URLString];
    
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //增加一种类型，text/html类型
    NSSet *set = mgr.responseSerializer.acceptableContentTypes;
    NSMutableSet *acceptSet = [NSMutableSet setWithSet:set];
    [acceptSet addObject:@"text/html"];
    mgr.responseSerializer.acceptableContentTypes = acceptSet;
    mgr.requestSerializer.timeoutInterval = 30;
    
    [mgr GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // AFN请求成功时候调用block
        // 先把请求成功要做的事情，保存到这个代码块
        if (success) {
            success(responseObject);
        }
        

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString  *urlStr = [SERVICE_INNER stringByAppendingFormat:@"%@&",URLString];
    
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //增加一种类型，text/html类型
    NSSet *set = mgr.responseSerializer.acceptableContentTypes;
    NSMutableSet *acceptSet = [NSMutableSet setWithSet:set];
    [acceptSet addObject:@"text/html"];
    mgr.responseSerializer.acceptableContentTypes = acceptSet;
    mgr.requestSerializer.timeoutInterval = 30;
    
    [mgr POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // AFN请求成功时候调用block
        // 先把请求成功要做的事情，保存到这个代码块
        if (success) {
            success(responseObject);
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
@end
