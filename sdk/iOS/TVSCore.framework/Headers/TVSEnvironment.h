//
//  TVSEnvironment.h
//  DMSDK
//
//  Created by Rinc Liu on 18/11/2017.
//  Copyright © 2017 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 * @brief TVS 后台环境
 */
typedef NS_ENUM(NSInteger,TVSServerEnv) {
    /*
     * @brief 正式环境（默认）
     */
    TVSServerEnvFormal,
    
    /*
     * @brief 体验环境
     */
    TVSServerEnvExplore,
    
    /*
     * @brief 测试环境
     */
    TVSServerEnvTest,
    
    /*
     * @brief 开发环境
     */
    TVSServerEnvDev
};


/*
 * @class TVSEnvironment
 * @warning 必须在调用 DMSDK 其他接口前设置！！
 * @brief TVS 环境设置接口
 */
@interface TVSEnvironment : NSObject

/*
 * @brief 后台环境
 */
@property(nonatomic,assign) TVSServerEnv serverEnv;

/*
 * @brief 获得 TVS 环境类单例对象
 * @return TVS 环境类实例
 */
+(instancetype)shared;

/*
 * @brief 读取 TVS 后台环境配置
 * @return TVS 后台环境
 */
-(TVSServerEnv)serverEnv;

/*
 * @brief 开启日志
 */
-(void)enableLog;

/*
 * @brief 设置 TVS 后台环境
 * @param env TVS 后台环境
 */
-(void)setServerEnv:(TVSServerEnv)env;


/*
 * @brief 获得 SDK 版本
 * @return SDK 版本
 */
-(NSString*)sdkVersion;

@end
