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
 * @brief 初始化方法
 * @param tskmProxy 技能服务访问代理
 * @return TVSThirdPartyAuth 实例
 */
-(instancetype)initWithTSKMProxy:(TVSTSKMProxy*)tskmProxy;

/*
 * @brief 获取第三方跳转链接
 * @param accountType 账号类型
 * @param productId ProductId
 * @param dsn 设备序列号
 * @param deviceGuid 设备 GUID(通过查询设备信息返回)
 * @return 第三方账号授权跳转链接
 */
+(nullable NSURL*)urlWithAccountType:(TVSAccountType)accountType productId:(NSString*)productId dsn:(NSString*)dsn deviceGuid:(NSString*)deviceGuid;

/*
 * @brief 第三方账号和设备信息绑定开关
 * @param binded 是否绑定
 * @param accountinfo 第三方账号信息(accountType、appId、openId、accessToken必填)
 * @param deviceInfo 设备信息(productId、dsn、guid必填)
 * @param handler 回调，BOOL 表示是否设置成功
 */
-(void)setBinded:(BOOL)binded accountInfo:(TVSAccountInfo*)accountInfo deviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(BOOL))handler;

/*
 * @brief 通过设备信息查询绑定的第三方账号信息
 * @param deviceInfo 设备信息(productId、dsn、guid必填)
 * @param handler 回调，TVSAccountInfo* 表示查询到的账号信息
 */
-(void)getBindedAccountInfoWithDeviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(TVSAccountInfo*))handler;

@end
