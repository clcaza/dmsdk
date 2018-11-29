//
//  TVSDeviceBind.h
//  TVSAccountSDK
//
//  Created by Rinc Liu on 17/11/2017.
//  Copyright © 2017 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVSAccount.h"



/*!
 * @brief 设备绑定类型
 */
typedef NS_ENUM(NSInteger,TVSDeviceBindType) {
    /*!
     * @brief SDK 接入方案的 App
     */
    TVSDeviceBindTypeSDKApp,
    
    /*!
     * @brief SDK 接入方案的音箱
     */
    TVSDeviceBindTypeSDKSpeaker,
    
    /*!
     * @brief 云端 API 接入方案的 App
     */
    TVSDeviceBindTypeTVSApp,
    
    /*!
     * @brief 云端 API 接入方案的音箱
     */
    TVSDeviceBindTypeTVSSpeaker
};



/*!
 * @class TVSPushDevice
 * @brief TVS Push 设备
 */
@interface TVSPushDevice : NSObject

/*!
 * @brief productId TVS 后台申请的 appid:accessToken
 */
@property(nonatomic,copy) NSString* productId;

/*!
 * @brief DSN 设备序列号
 */
@property(nonatomic,copy) NSString* DSN;

/*!
 * @brief bindType 设备绑定类型
 */
@property(nonatomic,assign) TVSDeviceBindType bindType;

/*!
 * @brief pushId
 */
@property(nonatomic,copy) NSString* pushId;

/*!
 * @brief pushIdExtra
 */
@property(nonatomic,copy) NSString* pushIdExtra;

/*!
 * @brief guid
 */
@property(nonatomic,copy) NSString* guid;

/*!
 * @brief deviceId 设备ID
 */
@property(nonatomic,copy) NSString* deviceId;

/*!
 * @brief deviceName 设备名
 */
@property(nonatomic,copy) NSString* deviceName;

/*!
 * @brief deviceType 设备类型
 */
@property(nonatomic,copy) NSString* deviceType;

/*!
 * @brief deviceSerial 设备系列
 */
@property(nonatomic,copy) NSString* deviceSerial;

/*!
 * @brief deviceOEM 设备厂商
 */
@property(nonatomic,copy) NSString* deviceOEM;

/*!
 * @brief deviceOEMUrl 设备品牌图标
 */
@property(nonatomic,copy) NSString* deviceOEMUrl;

/*!
 * @brief deviceMark 设备备注
 */
@property(nonatomic,copy) NSString* deviceMark;

/*!
 * @brief QUA
 */
@property(nonatomic,copy) NSString* QUA;

/*!
 * @brief IMEI
 */
@property(nonatomic,copy) NSString* IMEI;

/*!
 * @brief LC
 */
@property(nonatomic,copy) NSString* LC;

/*!
 * @brief MAC
 */
@property(nonatomic,copy) NSString* MAC;

/*!
 * @brief QIMEI
 */
@property(nonatomic,copy) NSString* QIMEI;

/*!
 * @brief enrollTime 注册时间
 */
@property(nonatomic,assign) long long enrollTime;

/*!
 * @brief bindTime 绑定时间
 */
@property(nonatomic,assign) long long bindTime;


/*!
 * @brief extra 扩展信息
 */
@property(nonatomic,strong) NSDictionary* extra;

/*!
 * @brief accountinfo 账号信息
 */
@property(nonatomic,strong) TVSAccountInfo* accountinfo;

@end



/*!
 * @class TVSDeviceBind
 * @brief TVS 设备发现/绑定接口
 */
@interface TVSDeviceBind : NSObject

/*!
 * @brief 获得 TVS 设备发现类单例对象
 * @return TVS 设备发现类实例
 */
+(instancetype)shared;

/*!
 * @brief 有屏音箱扫码预绑定
 * @warning 必须确保已登录！！
 * @param pushDevice 设备信息，其中 productId 、 DSN、bindType 必传!!
 * @param cancel 是否取消预绑定
 * @param handler 回调，BOOL 值表示是否成功
 */
-(void)preBindScreenDevice:(TVSPushDevice*)pushDevice cancel:(BOOL)cancel handler:(void(^)(BOOL))handler;

/*!
 * @brief 绑定设备
 * @warning 必须确保已登录！！
 * @param pushDevice 设备信息，其中 productId、 DSN、bindType 必传!!
 * @param handler 回调，BOOL 值表示是否成功
 */
-(void)bindDevice:(TVSPushDevice*)pushDevice handler:(void(^)(BOOL))handler;

/*!
 * @brief 解绑设备
 * @warning 必须确保已登录！！
 * @param pushDevice 设备信息，其中 productId、 DSN、bindType 必传!!
 * @param handler 回调，BOOL 值表示是否成功
 */
-(void)unbindDevice:(TVSPushDevice*)pushDevice handler:(void(^)(BOOL))handler;

/*!
 * @brief 通过 guid 查询设备列表
 * @param guid
 * @param bindType 设备绑定类型
 * @param handler 回调
 */
-(void)queryDevicesByGuid:(NSString*)guid bindType:(TVSDeviceBindType)bindType handler:(void(^)(NSArray<TVSPushDevice*>*))handler;

/*!
 * @brief 通过账号查询设备列表
 * @warning 必须确保已登录！！
 * @param bindType 设备绑定类型
 * @param handler 回调
 */
-(void)queryDevicesByAccountWithBindType:(TVSDeviceBindType)bindType handler:(void(^)(NSArray<TVSPushDevice*>*))handler;

/*!
 * @brief 根据设备信息反查绑定的账号信息
 * @param pushDevice 设备信息，其中 productId、 DSN、bindType 必传!!
 * @param handler 回调，TVSAccountInfo 为账号信息
 */
-(void)queryAccountWithDevice:(TVSPushDevice*)pushDevice handler:(void(^)(TVSAccountInfo*))handler;

/*!
 * @brief 根据设备信息反查绑定的账号信息
 * @param productId
 * @param dsn
 * @param handler 回调，TVSAccountInfo 为账号信息
 */
-(void)queryAccountWithDeviceProductId:(NSString*)productId dsn:(NSString*)dsn handler:(void(^)(TVSAccountInfo*))handler;

@end
