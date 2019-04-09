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
 * @brief 设备控制，必须调用设备绑定后执行 参考设备控制接口文档!!!
 * @param nameSpace 操作域
 * @param command 操作指令
 * @param palyload 操作参数
 * @param handler 操作回调
 * @return 操作唯一串
 */
-(NSString *)controlDeviceWithNamespace:(NSString *)nameSpace command:(NSString *)name payload:(NSDictionary *)palyload handler:(TVSTSKMCallback)handler;

@end
