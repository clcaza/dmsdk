# 腾讯叮当手机端SDK

| 文件夹  | 说明 |
| -------- | --------- |
| demo | 手机端 SDK 的 demo 参考 |
| doc | 手机端 SDK 文档 |
| sdk | 手机端 SDK |

## 更新日志：

[Android](#Android) (Latest: v2.0.2)

[iOS](#iOS) (Latest: v2.1.0)

**v1.0 到 v2.0.0+ API 变更较大，请阅读升级指南([Android 版][5] | [iOS 版][4])。**

### Android

### [v2.0.2][6]

*   修复Web模块的ProxyData回调收到的JSONObject结构，保持与iOS端DMSDK的结果一致；
*   修复了二维码模块一个Crash；
*   修复了TAuthActivity的QQOpenAppID配置错误导致可能无法QQ登录的问题，该问题的具体影响和解决方案请见迁移文档。

### [v2.0.1][3]

* H5 模块新增链接加载拦截回调；

* H5 模块新增智能家居页面；

* Core 模块新增接口重复登录前是否登出；

* Core 模块设备绑定相关接口修复不能获取设备businessExtra信息的问题。

#### [v2.0.0][2]

* 模块化拆分，核心模块(环境配置/账号/设备绑定)为必须，H5 等模块根据需要可选；

* H5 模块由 `TVSAssistActivity` 页面改为 `WebView` 组件形式，可定制化程度更高；

* H5 模块支持自己实现账号授权（不调用此 SDK 做登录和刷票）；

* 新增二维码模块，用于无屏设备账号授权。

#### [v1.0][1]

* 提供基本的账号授权、设备绑定、H5 等功能。 

### iOS

#### v2.1.0:

* 账号模块新增根据指定用户 openId 查询 UserInfo 接口；

* 技能服务模块新增闹钟管理、儿童模式、第三方账号授权接口；

* 修复设备查询 guid 被覆盖问题；

#### [v2.0.1][3]:

* H5 模块新增链接加载拦截回调；

* H5 模块新增智能家居页面；

* 修复日志模块重复初始化问题；

* 新增 armv7/armv7s/i386 架构;

#### [v2.0.0][2]:

* 模块化拆分，核心模块(环境配置/账号/设备绑定)为必须，H5 等模块根据需要可选；

* H5 模块由 `ViewController` 页面改为 `WebView` 组件形式，可定制化程度更高；

* H5 模块支持自己实现账号授权（不调用此 SDK 做登录和刷票）；

* 新增二维码模块，用于无屏设备账号授权；

#### [v1.0][1]:

* 提供基本的账号授权、设备绑定、H5 等功能； 

[1]: https://github.com/TencentDingdang/dmsdk/tree/v1.0
[2]: https://github.com/TencentDingdang/dmsdk/tree/v2.0.0
[3]: https://github.com/TencentDingdang/dmsdk/tree/v2.0.1
[4]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/README.md#ios-sdk-v10---v200-%E5%8D%87%E7%BA%A7%E6%8C%87%E5%8D%97
[5]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/Android/%E7%89%88%E6%9C%AC%E6%9B%B4%E6%96%B0%E6%97%A5%E5%BF%97.md#%E8%BF%81%E7%A7%BB%E6%8C%87%E5%8D%97-1
[6]: https://github.com/TencentDingdang/dmsdk/tree/v2.0.2-android
