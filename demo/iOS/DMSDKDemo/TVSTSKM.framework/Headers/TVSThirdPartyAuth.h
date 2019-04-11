//
//  TVSThirdPartyAuth.h
//  TVSCore
//
//  Created by Rinc Liu on 28/3/2019.
//  Copyright © 2019 RINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TVSCore/TVSAuth.h>
#import <TVSCore/TVSDevice.h>
#import <TVSTSKM/TVSTSKMProxy.h>

/*
 * @class TVSThirdPartyAuth
 * @brief TVS 第三方授权
 */
@interface TVSThirdPartyAuth : NSObject

/*
 * @brief 跳转到云叮当 APP 进行第三方授权
 * @param accountInfo 账号信息，使用本 SDK 做账号登录的传 nil
 * @param deviceInfo 设备信息，其中 productId、dsn、guid 必填！！
 * @param handler 回调，BOOL 表示是否成功
 * @return 第三方账号授权跳转链接
 */
+(void)gotoAuthWithAccountInfo:(nullable TVSAccountInfo*)accountInfo deviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(BOOL))handler;

@end
