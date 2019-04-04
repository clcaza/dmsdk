//
//  TVSAlarm.h
//  TVSTSKM
//
//  Created by Rinc Liu on 4/4/2019.
//  Copyright © 2019 RINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TVSTSKM/TVSTSKMProxy.h>

/*
 * @class TVSAlarm
 * @brief TVS 闹钟管理
 */

@interface TVSAlarm : NSObject

/*
 * @brief 初始化方法
 * @param tskmProxy 技能服务访问代理
 * @return TVSAlarm 实例
 */
-(instancetype)initWithTSKMProxy:(TVSTSKMProxy*)tskmProxy;

/*
 * @brief 管理闹钟
 * @param jsonBlob 请求数据
 * @return handler 回调
 */
-(void)manageWithJsonBlob:(NSDictionary*)jsonBlob handler:(TVSTSKMCallback)handler;

@end
