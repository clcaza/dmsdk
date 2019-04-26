//
//  TVSDeviceControl.h
//  TVSTSKM
//
//  Created by Rinc Liu on 1/4/2019.
//  Copyright © 2019 RINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TVSTSKM/TVSTSKMProxy.h>

/*
 * @class TVSDeviceControl
 * @brief TVS 多端控制
 */
@interface TVSDeviceControl : NSObject

/*
 * @brief 初始化方法
 * @param tskmProxy 技能服务访问代理
 * @return TVSDeviceControl 实例
 */
-(instancetype)initWithTSKMProxy:(TVSTSKMProxy*)tskmProxy;

/*
 * @brief 设备绑定(APP和设备建立通道)
 * @param handler 操作回调
 */
-(void)bindDeviceWithHandler:(TVSTSKMCallback)handler;

/*
 * @brief 设备控制
 * @warning 必须调用设备绑定后执行!! messageId 字段内部会自动生成，并返回，无需自行传入！！
 * @param nameSpace 操作域
 * @param name 操作指令
 * @param palyload 操作参数
 * @param handler 操作回调
 * @return 操作唯一串
 */
-(NSString *)controlDeviceWithNamespace:(NSString *)nameSpace name:(NSString *)name payload:(NSDictionary *)palyload handler:(TVSTSKMCallback)handler;

@end
