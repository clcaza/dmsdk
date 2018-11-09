# DMSDK(iOS) API 文档

## 环境变量(TVSEnvironment.h)

### TVSServerEnv 后台环境枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSServerEnvFormal | 正式环境（默认） |
| TVSServerEnvExplore | 体验环节（灰度） |
| TVSServerEnvTest | 测试环境 |

### TVSEnvironment 环境变量类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| serverEnv | TVSServerEnv | 后台环境 |
| logEnabled | BOOL | 是否开启日志 |

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获取 TVSEnvironment 实例对象；

  **参数**:

  无;

  **返回**:

  TVSEnvironment 实例；

## 账号管理(TVSAccount.h)

### TVSAccountType 账号登录类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSAccountTypeQQNumber | QQ 号 |
| TVSAccountTypeQQOpenId | QQ 登录  |
| TVSAccountTypeWechatOpenId | 微信登录 |
| TVSAccountTypePhoneNumber | 手机号 |
| TVSAccountTypeQbId | QQ 浏览器 id |
| TVSAccountTypeIOSVistor | iOS 访客 |
| TVSAccountTypeUnknown | 未知类型 |

### TVSAccountInfo 账号信息类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| appId | NSString* | QQ/微信开放平台申请的 appId |
| openId | NSString* | QQ/微信登录返回的 openId |
| accessToken | NSString* | QQ/微信登录返回的 accessToken |
| refreshToken | NSString* | 微信用于刷票的 refreshToken |
| unionId | NSString* | 微信登录返回的 unionId |
| expireTime | NSInteger | QQ/微信 token 过期时间 |
| tvsId | NSString* | 腾讯云叮当开放平台返回的账号 id |
| userId | NSString* | 腾讯云叮当开放平台返回的 userId |

#### 方法

##### `+(NSString*)clientIdWithDSN:(NSString*)dsn productId:(NSString*)productId;`

  **描述**:

  获取腾讯云叮当开放平台 ClientId；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | dsn | NSString* | 设备序列号 | 是 |
  | productId | NSString* | 腾讯云叮当开放平台申请的 appid/accessToken 信息 | 是 |

  **返回**：

  腾讯云叮当开放平台 ClientId;

### TVSGeoLocation 用户地理位置信息类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| name | NSString* | 名称 |
| address | NSString* | 地址 |
| lng | NSString* | 经度 |
| lat | NSString* | 纬度 |
| cabName | NSString* | 打车点名称 |
| cabAddress | NSString* | 打车点地址 |
| cabLng | NSString* | 打车点经度 |
| cabLat | NSString* | 打车点纬度 |

#### 方法

  无；

### TVSUserInfo 用户资料信息类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| idType | TVSAccountType | 账号类型 |
| nickName | NSString* | 昵称 |
| headImgUrl |  NSString*| 头像 url |
| sex | NSInteger | 性别（0：女；1：男） |
| phoneNumber | NSString* | 手机号 |
| homelocation | TVSGeoLocation* | 家庭地址信息 |
| companyLocation | TVSGeoLocation* | 公司地址信息 |

#### 方法

  无；

### TVSAccount 账号管理类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获得 TVSAccount 类实例对象；

  **参数**:

  无；

  **返回**:
 
  TVSAccount 类实例；

##### `-(void)registerApp;`

  **描述**:

  初始化 (自动从 Info.plist 读取相关参数)；
  必须在 `AppDelegate` 的 `application:didFinishLaunchingWithOptions:` 方法中调用！

  **参数**:

  无；

  **返回**:

  无；
  
##### `-(BOOL)handleOpenUrl:(NSURL*)url;`

  **描述**:

  处理 URL 跳转；
  必须在 `AppDelegate` 的 `application:handleOpenURL:` 和 `application:openURL:sourceApplication:annotation:` 两个方法中调用!

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | url | NSURL* | url | 是 |

  **返回**:

  是否成功处理 URL 跳转；
  
##### `-(BOOL)isWXTokenExist;`

  **描述**:

  检查微信 token 是否存在；

  **参数**:

  无；

  **返回**:
  
  是否存在；
  
##### `-(BOOL)isQQTokenExist;`

  **描述**:

  检查 QQ token 是否存在；

  **参数**:

  无；

  **返回**:
 
  是否存在；
  
##### `-(void)wxLoginWithHandler:(void(^)(BOOL))handler;`

  **描述**:

  微信登录；
  如果微信 token 不存在，则必须调用此方法，以获得腾讯云叮当开放平台返回的相关账户信息！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否登录成功 | 是 |

  **返回**:

  无；
  
##### `-(void)wxLoginWithViewController:(UIViewController*)vc handler:(void(^)(BOOL))handler;`

  **描述**:

  微信登录(支持未安装微信的情况)；
  如果微信 token 不存在，则必须调用此方法，以获得腾讯云叮当开放平台返回的相关账户信息！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | viewController | UIViewController* | 发起微信登录的页面 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否登录成功 | 是 |

  **返回**:

  无；
  
##### `-(void)wxPayWithAppId:(NSString*)appId partnerid:(NSString*)partnerid prepayid:(NSString*)prepayid package:(NSString*)package noncestr:(NSString*)noncestr sign:(NSString*)sign timestamp:(UInt32)timestamp handler:(void(^)(BOOL,NSString*))handler;`

  **描述**:

  微信支付(NativeSDK 方式)；
  注意后台生成的订单类型必须是 app 支付，不能是 h5 订单，否则微信会报错“支付场景非法”；并且必须保证后台订单的 appId 和客户端微信 sdk 的 appid 一致！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | appId | NSString* | 后台生成的微信支付订单 appid | 是 |
  | partnerid | NSString* | 后台生成的微信支付订单商户 id | 是 |
  | prepayid | NSString* | 后台生成的微信支付订单预支付 id | 是 |
  | package | NSString* | 后台生成的微信支付订单 package | 是 |
  | noncestr | NSString* | 后台生成的微信支付订单 noncestr | 是 |
  | sign | NSString* | 后台生成的微信支付订单签名 | 是 |
  | timestamp | UInt32 | 后台生成的微信支付订单时间戳 | 是 |
  | handler | void(^)(BOOL,NSString*) |  回调，BOOL 表示是否支付成功，NSString* 为微信支付返回的 key | 是 |

  **返回**:

  无；
  
##### `-(void)wxPayWithAppId:(NSString*)appId partnerid:(NSString*)partnerid prepayid:(NSString*)prepayid package:(NSString*)package noncestr:(NSString*)noncestr sign:(NSString*)sign timestamp:(UInt32)timestamp;`

  **描述**:

  微信支付(openURL 方式)；
  注意后台生成的订单类型必须是 app 支付，不能是 h5 订单，否则微信会报错“支付场景非法”！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | appId | NSString* | 后台生成的微信支付订单 appid | 是 |
  | partnerid | NSString* | 后台生成的微信支付订单商户 id | 是 |
  | prepayid | NSString* | 后台生成的微信支付订单预支付 id | 是 |
  | package | NSString* | 后台生成的微信支付订单 package | 是 |
  | noncestr | NSString* | 后台生成的微信支付订单 noncestr | 是 |
  | sign | NSString* | 后台生成的微信支付订单签名 | 是 |
  | timestamp | UInt32 | 后台生成的微信支付订单时间戳 | 是 |

  **返回**:

  无；
  
##### `-(BOOL)checkWXAppWithAlert:(BOOL)alert;`

  **描述**:

  检测微信是否安装，版本是否支持；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | alert | BOOL | 是否弹窗提示 | 是 |

  **返回**:

  安装微信且版本支持返回 `YES`;

  
##### `-(void)qqLoginWithHandler:(void(^)(BOOL))handler;`

  **描述**:

  QQ 登录；
  如果 QQ token 不存在，则必须调用此方法，以获得腾讯云叮当开放平台返回的相关账户信息！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否登录成功 | 是 |

  **返回**:

  无；
  
##### `-(void)wxTokenRefreshWithHandler:(void(^)(BOOL))handler;`

  **描述**:

  刷新微信 token；
  如果微信 token 存在，则必须调用此方法，以获得(更新)腾讯云叮当开放平台返回的相关账户信息！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否刷票成功 | 是 |

  **返回**:

  无；
  
##### `-(void)qqTokenVerifyWithHandler:(void(^)(BOOL))handler;`

  **描述**:

  验证 QQ token;
  如果 QQ token 存在，则必须调用此方法，以获得(更新)腾讯云叮当开放平台返回的相关账户信息!

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否验票成功 | 是 |

  **返回**:

  无；
  
##### `-(void)tvsAuthWithOpenId:(NSString*)openId accessToken:(NSString*)accessToken isWX:(BOOL)isWX handler:(void(^)(BOOL))handler;`

  **描述**:

  通过微信/QQ 账号信息直接到腾讯云叮当开放平台授权（换取tvsId）；
  仅针对之前已经独自接入 QQ/微信 SDK，且自己维护 token 过期刷新的场景！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | openId | NSString* | QQ/微信登录返回的 openId | 是 |
  | accessToken | NSString* | QQ/微信登录返回的 accessToken | 是 |
  | isWX | BOOL | 是否微信登录 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 标识是否成功，成功后即可通过 TVSAccountInfo 读取 tvsId | 是 |

  **返回**:

  无；
  
##### `-(void)verifyQQTokenWithOpenId:(NSString*)openId accessToken:(NSString*)accessToken handler:(void(^)(BOOL))handler;`

  **描述**:

  验证 QQ token；
  仅针对之前已经独自接入 QQ/微信 SDK，且自己维护 token 过期刷新的场景！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | openId | NSString* | QQ/微信登录返回的 openId | 是 |
  | accessToken | NSString* | QQ/微信登录返回的 accessToken | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 标识是否成功，成功后即可通过 TVSAccountInfo 读取 tvsId | 是 |

  **返回**:

  无；
  
##### `-(BOOL)setUserProfileJson:(NSString*)json;`

  **描述**:

  保存微信/QQ 登录返回的用户资料信息；
  仅针对之前已经独自接入 QQ/微信 SDK，且自己维护 token 过期刷新的场景！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | json | NSString* | 微信/QQ 登录返回的用户资料信息 JSON | 是 |

  **返回**:

  是否设置成功；

  
##### `-(BOOL)startWXQRCodeAuthWithImageHandler:(void(^)(UIImage*))imageHandler scannedHandler:(void(^)(void))scannedHandler finishHandler:(void(^)(BOOL))finishHandler;`

  **描述**:

  开始微信二维码登录；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | imageHandler | void(^)(UIImage*) | 获取到二维码的回调 | 是 |
  | scannedHandler | void(^)(void) | 扫描后的回调 | 是 |
  | finishHandler | void(^)(BOOL) | 完成授权回调，BOOL 表示是否成功 | 是 |

  **返回**:

  是否请求成功；

  
##### `-(BOOL)stopWXQRCodeAuth;`

  **描述**:

  停止微信二维码登录；

  **参数**:

  无；

  **返回**:
 
  是否成功；
  
##### `-(TVSAccountInfo*)accountInfo;`

  **描述**:

  获取账号信息；
  必须确保已登录！

  **参数**:

  无；

  **返回**:

  TVSAccountInfo* 账号信息；
  
##### `-(TVSUserInfo*)userInfo;`

  **描述**:

  获取用户资料信息；
  必须确保已登录！

  **参数**:

  无；

  **返回**:

  TVSUserInfo* 用户资料信息；
  
##### `-(void)logout;`

  **描述**:

  注销登录（清除本地保存的账户信息）；

  **参数**:

  无；

  **返回**:
 
  无；
  
##### `-(void)getCaptchaWithPhoneNumber:(NSString*)phoneNumber handler:(void(^)(BOOL))handler;`

  **描述**:

  获取用于绑定手机号的验证码；
  必须确保已登录！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | phoneNumber | NSString* | 手机号 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示验证码是否发送成功 | 是 |

  **返回**:

  无；
  
##### `-(void)bindPhoneNumber:(NSString*)phoneNumber captcha:(NSString*)captcha handler:(void(^)(BOOL))handler;`

  **描述**:

  绑定手机号；
  必须确保已登录！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | phoneNumber | NSString* | 手机号 | 是 |
  | captcha | NSString* | 验证码 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否绑定成功 | 是 |

  **返回**:

  否；
  
##### `-(void)setCustomUserInfoWithNickName:(NSString*)nickName avatarUrl:(NSString*)avatarUrl handler:(void(^)(BOOL))handler;`

  **描述**:

  设置用户自定义信息；
  必须确保已登录！

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | nickName | NSString* | 昵称 | 是 |
  | avatarUrl | NSString* | 头像 url | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否设置成功 | 是 |

  **返回**:

  无；

## 设备管理(TVSDeviceBind.h)

### TVSPushDevice 设备信息实体类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| productId | NSString* | 腾讯云叮当开放平台申请的 appid/accessToken 信息 |
| DSN | NSString* | 设备序列号 |
| pushId | NSString* | 用于 push 的标识 |
| pushIdExtra | NSString* | pushId 扩展字段 |
| guid | NSString* | 全局唯一标识 |
| deviceId | NSString* | 设备标识 |
| deviceName | NSString* | 设备名 |
| deviceType | NSString* | 设备类型 |
| deviceSerial | NSString* | 设备系列 |
| deviceOEM | NSString* | 设备厂商 |
| deviceOEMUrl | NSString* | 设备厂商 logo url |
| deviceMark | NSString* | 设备备注 |
| QUA | NSString* |  |
| IMEI | NSString* |  |
| LC | NSString* |  |
| MAC | NSString* | MAC 地址 |
| QIMEI | NSString* |  |
| enrollTime | long long | 注册时间 |
| bindTime | long long | 绑定时间 |
| extra | NSDictionary* | 扩展信息字典 |

#### 方法

  无；
  
### TVSDeviceBindType 设备绑定类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSDeviceBindTypeSDKApp | SDK 接入方案的 App |
| TVSDeviceBindTypeSDKSpeaker | SDK 接入方案的音箱 |
| TVSDeviceBindTypeTVSApp | 云端 API 接入方案的 App |
| TVSDeviceBindTypeTVSSpeaker | 云端 API 接入方案的音箱 |

### TVSDeviceBind 设备绑定类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获取 TVSDeviceBind 类实例对象;

  **参数**:

  无;

  **返回**：

  TVSDeviceBind 实例；

##### `-(void)bindAppWithGuid:(NSString*)guid deviceToken:(NSString*)deviceToken bundleId:(NSString*)bundleId qua:(NSString*)qua extra:(NSDictionary*)extra handler:(void(^)(BOOL))handler;`

  **描述**：

  绑定 APP；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | guid | NSString* | 全局唯一标识 | 是 |
  | deviceToken | NSString* | 苹果 APNS 给 iOS push 设备分配的唯一标识 | 是 |
  | bundleId | NSString* | 应用唯一标识 | 是 |
  | qua | NSString* |  | 是 |
  | extra | NSDictionary* | 扩展信息字典 | 否 |
  | handler | void(^)(BOOL) | 回调，BOOL 值表示是否绑定成功 | 是 |

  **返回**：

  无；

##### `-(void)bindDevice:(TVSPushDevice*)pushDevice handler:(void(^)(BOOL))handler;`

  **描述**：

  绑定设备；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | pushDevice | TVSPushDevice* | 设备信息 | 其中 productId、DSN 必须填，其他字段根据需要透传 |
  | handler | void(^)(BOOL) | 回调，BOOL 标识是否绑定成功 | 是 |

  **返回**：

  无；

##### `-(void)unbindDeviceWithProductId:(NSString*)productId dsn:(NSString*)dsn handler:(void(^)(BOOL))handler;`

  **描述**：

  解绑设备；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | productId | NSString* | 腾讯云叮当开放平台申请的 appid/accessToken 信息 | 是 |
  | dsn | NSString* | 设备序列号 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL标识是否解绑成功 | 是 |

  **返回**：

  无；

##### `-(void)queryPushDevicesWithHandler:(void(^)(NSArray<TVSPushDevice*>*))handler;`

  **描述**：

  查询绑定过的设备列表；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | void(^)(NSArray<TVSPushDevice*>*) | 回调，返回设备信息列表 | 是 |

  **返回**：

  无；

##### `-(void)queryBoundAccountWithDeviceProductId:(NSString*)productId dsn:(NSString*)dsn handler:(void(^)(TVSAccountInfo*))handler;`

  **描述**：

  根据设备信息反查绑定的账号信息；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | productId | NSString* | 腾讯云叮当开放平台申请的 appid/accessToken 信息  | 是 |
  | dsn | NSString* | 设备序列号 | 是 |
  | handler | void(^)(TVSAccountInfo*) | 回调，返回账号信息 TVSAccountInfo，具体字段定义详见账号管理部分  | 是 |

  **返回**：

  无；

## H5页面(TVSWebPage.h)

### TVSWebPageType H5 页面类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSWebPageTypeMember | 会员个人中心页面 |
| TVSWebPageTypeVIP | 会员领取页面 |
| TVSWebPageTypeRecharge | 会员充值页面 |
| TVSWebPageTypePhoneAddress | 手机号地址页面 |
| TVSWebPageTypeFeedback | 用户反馈页面 |
| TVSWebPageTypeAITrainer | AI 训练师（自定义问答）页面 |

### TVSWebPageDelegate H5 页面回调协议

##### `-(void)TVSDidLoadPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面 ViewController `viewDidLoad` 回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSWillAppearPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面 ViewController `viewWillAppear` 回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSDidAppearPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面 ViewController `viewDidAppear` 回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSWillDisappearPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面 ViewController `viewWillDisappear` 回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSDidDisappearPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面 ViewController `viewDidDisappear` 回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType qqLoginResult:(BOOL)result;`

  **描述**:

  H5 页面 QQ 登录回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |
  | result | BOOL | QQ 登录是否成功 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType wxLoginResult:(BOOL)result;`

  **描述**:

  H5 页面微信登录回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |
  | result | BOOL | 微信登录是否成功 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType verifyQQTokenResult:(BOOL)result;`

  **描述**:

  H5 页面 QQ 验票回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |
  | result | BOOL | QQ 验票是否成功 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType refreshWXTokenResult:(BOOL)result;`

  **描述**:

  H5微信刷票回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |
  | result | BOOL | 微信刷票是否成功 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType wxPayResult:(BOOL)result;`

  **描述**:

  H5 页面微信支付回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 也没按类型 |
  | result | BOOL | 微信支付是否成功 |

  **返回**:

  无;

##### `-(void)TVSUnbindAtPage:(TVSWebPageType)pageType;`

  **描述**:

  H5 页面设备解绑回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |

  **返回**:

  无;

##### `-(void)TVSPage:(TVSWebPageType)pageType receivedRemoteControlEvent:(UIEvent*)event;`

  **描述**:

  H5 页面收到远程控制事件回调；

  **参数**:

  | 名称 | 类型 | 描述 |
  | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 |
  | event | UIEvent* | 远程控制事件 |

  **返回**:

  无;

### TVSWebPage H5 页面类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获取 TVSWebPage 类的实例对象；

  **参数**：

  无；

  **返回**：

  TVSWebPage 类的实例；

##### `-(void)setDeviceBindType:(TVSDeviceBindType)deviceBindType deviceType:(NSString*)deviceType deviceOEM:(NSString*)deviceOEM productId:(NSString*)productId DSN:(NSString*)dsn;`

  **描述**：

  设置设备信息（H5 页面自动绑定设备、查询会员信息等需要用到）;

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | deviceBindType | TVSDeviceBindType | 设备绑定类型 | 是 |
  | deviceType | NSString* | 设备类型 | 是 |
  | deviceOEM | NSString* | 设备厂商 | 是 |
  | productId | NSString* | 设备 productId | 是 |
  | dsn | NSString* | 设备序列号 | 是 |

  **返回**：

  无；

##### `-(BOOL)enterPage:(TVSWebPageType)pageType fromViewController:(UIViewController*)fromViewController title:(NSString*)title delegate:(id<TVSWebPageDelegate>)delegate;`

  **描述**：

  打开指定类型的 H5 页面；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | pageType | TVSWebPageType | H5 页面类型 | 是 |
  | fromViewController | UIViewController* | 起始页面 | 是 |
  | title | NSString* | 页面标题，如果为空会自动读取网页标题 | 否 |
  | delegate | TVSWebPageDelegate | H5 页面回调 | 否 |

  **返回**：

  是否成功；

## 会员(TVSMember.h)

### TVSMemberType 会员类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSMemmerTypeQQMusic | QQ 音乐会员 |

### TVSMemberUnit 会员时长单位枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSMemberUnitYear | 年 |
| TVSMemberUnitMonth | 月 |

### TVSMember 会员类

#### 成员

  无；

#### 方法

##### `-(instancetype)initWithDeviceType:(NSString*)deviceType deviceOEM:(NSString*)deviceOEM productId:(NSString*)productId DSN:(NSString*)dsn;`

  **描述**：

  返回 TVSMember 实例对象；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | deviceType | NSString* | 设备类型 | 是 |
  | deviceOEM | NSString* | 设备厂商 | 是 |
  | productId | NSString* | 设备 productId | 是 |
  | dsn | NSString* | 设备序列号 | 是 |

  **返回**：

  TVSMember 类实例；

##### `-(void)queryDeviceStatusWithType:(TVSMemberType)type handler:(void(^)(BOOL,NSInteger,TVSMemberUnit))handler;`

  **描述**：

  查询设备是否领取过会员；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | type | TVSMemberType | 会员类型 | 是 |
  | handler | void(^)(BOOL,NSInteger,TVSMemberUnit | 回调，BOOL 值表示是否可以领取会员，NSInteger 和 TVSMemberUnit 分别表示可以领取的会员时长数量和单位 | 是 |

  **返回**：

  无；

##### `-(void)queryMemberStatusWithType:(TVSMemberType)type handler:(void(^)(BOOL,NSDate*,NSDate*))handler;`

  **描述**：

  查询会员状态；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | type | TVSMemberType | 会员类型 | 是 |
  | handler | (void(^)(BOOL,NSDate*,NSDate*) | 回调，BOOL 值表示是否是否会员，两个 NSDate 分别表示会员开始时间、会员过期时间 | 是 |

  **返回**：

  无；

## OCMS(TVSOCMS.h)

### TVSAISpeechItem 音色配置类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| speechId | NSString* | 音色 id |
| speechName | NSString* | 音色名称 |
| speechEnum | NSString* | AISpeechType 枚举值 |
| isDefaultOption | NSString* | 是否默认音色 |

#### 方法

  无；

### TVSOCMS 类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**：

  获取 TVSOCMS 类实例对象；

  **参数**：

  无；

  **返回**：

  TVSOCMS 类实例；

##### `-(void)getBotAISpeechOptionWithProductId:(NSString*)productId handler:(void(^)(NSArray<TVSAISpeechItem*>*))handler;`

  **描述**：

  获取 bot 音色配置；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | productId | NSString* | 设备 productId | 是 |
  | handler | void(^)(NSArray<TVSAISpeechItem*>*) | 回调，返回配置列表 | 是 |

  **返回**：

  无；

##### `-(void)getDeviceAISpeechWithDeviceGUID:(NSString*)deviceGUID productId:(NSString*)productId DSN:(NSString*)dsn handler:(void(^)(TVSAISpeechItem*))handler;`

  **描述**：

  获取设备音色配置；
  必须登录后调用！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | deviceGUID | NSString* | 设备 guid | 是 |
  | productId | NSString* | 设备 productId | 是 |
  | DSN | NSString* | 设备序列号 | 是 |
  | handler | void(^)(TVSAISpeechItem*) | 回调，返回音色配置 | 是 |

  **返回**：

  无；

##### `-(void)setDeviceAISpeechId:(NSString*)speechID productId:(NSString*)productId DSN:(NSString*)dsn handler:(void(^)(BOOL))handler;`
  **描述**：

  设置设备音色；
  必须登录后调用！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | speechID |  NSString* | 音色 id | 是 |
  | productId | NSString* | 设备 productId | 是 |
  | DSN | NSString* | 设备序列号 | 是 |
  | handler | void(^)(BOOL) | 回调，返回是否设置成功 | 是 |

  **返回**：

  无；

## TSKM(TVSTSKM.h)

### TVSTSKM 类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**：

  获得 TVSTSKM 类实例对象；

  **参数**：

  无；

  **返回**：

  TVSTSKM 实例；

##### `-(void)uniAccessWithDeviceSerialNum:(NSString*)deviceSerialNum deviceGuid:(NSString*)deviceGuid deviceProductId:(NSString*)deviceProductId domain:(NSString*)domain intent:(NSString*)intent blobInfo:(NSDictionary*)blobInfo handler:(void(^)(BOOL,NSDictionary*))handler;`

  **描述**：

  腾讯云叮当开放平台各领域服务统一访问接口；
  必须确保已经登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | deviceSerialNum | NSString* | 设备序列号 | 和 deviceGuid 二选一 |
  | deviceGuid | NSString* | 设备 guid | 和 deviceSerialNum 二选一 |
  | deviceProductId | NSString* | 设备 productId | 是 |
  | domain | NSString* | 服务领域 | 是 |
  | intent | NSString* | 服务意图 | 是 |
  | blobInfo | NSDictionary* | 参数字典 | 是 |
  | handler | void(^)(BOOL,NSDictionary*) | 回调，BOOL 表示是否调用成功，NSDictionary* 为后台返回的数据字典 | 是 |

  **返回**：

  无；

## 闹钟提醒管理(TVSAlarmManager.h)

### TVSAlarmRepeatType 闹钟提醒重复类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSAlarmRepeatTypeOnce | 单次不重复 |
| TVSAlarmRepeatTypeDay | 每天重复 |
| TVSAlarmRepeatTypeWeek | 每周重复 |
| TVSAlarmRepeatTypeMonth | 每月重复 |
| TVSAlarmRepeatTypeWorkday | 工作日重复 |
| TVSAlarmRepeatTypeWeekend | 周末重复 |

### TVSAlarm 闹钟提醒实体类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| alarmId | long | 闹钟提醒 id |
| alarmTime | long | 闹钟提醒时间戳 |
| alarmNote | NSString* | 闹钟提醒内容 |
| alarmRepeatType | TVSAlarmRepeatType | 闹钟提醒重复类型 |
| deviceProductId | NSString* | 设备 productId |
| deviceGuid | NSString* | 设备 guid |

#### 方法

  无；

### TVSAlarmManager 闹钟提醒管理类

#### 成员

  无；

#### 方法

##### `-(instancetype)initWithBussiness:(NSString*)business botKey:(NSString*)botKey botToken:(NSString*)botToken;`

  **描述**：

  获得 TVSAlarmManager 类实例对象；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | business | NSString* | 业务名 | 是 |
  | botKey | NSString* | bot 的 key | 是 |
  | botToken | NSString* | bot 的 token | 是 |

  **返回**：

  TVSAlarmManager 类实例；

##### `-(void)queryAlarmsWithDeviceProductId:(NSString*)deviceProductId deviceGuid:(NSString*)deviceGuid handler:(void(^)(NSArray<TVSAlarm*>*))handler;`

  **描述**：

  查询所有闹钟提醒；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | deviceProductId | NSString* | 设备 productId | 是 |
  | deviceGuid | NSString* | 设备 guid | 是 |
  | handler | void(^)(NSArray<TVSAlarm*>*) | 回调，返回闹钟提醒列表 | 是 |

  **返回**：

  无；

##### `-(void)addAlarms:(NSArray<TVSAlarm*>*)alarms handler:(void(^)(BOOL))handler;`

  **描述**：

  添加闹钟提醒；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | alarms | NSArray<TVSAlarm*>* | 闹钟提醒列表 | TVSAlarm 除了 alarmId 和 alarmNote 其他字段都必须传 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否添加成功 | 是 |

  **返回**：

  无；

##### `-(void)updateAlarms:(NSArray<TVSAlarm*>*)alarms handler:(void(^)(BOOL))handler;`

  **描述**：

  修改闹钟提醒；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | alarms | NSArray<TVSAlarm*>* | 闹钟提醒列表 | TVSAlarm 必须传 alarmId、alarmTime、deviceProductId、deviceGuid |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否修改成功 | 是 |

  **返回**：

  无；

##### `-(void)deleteAlarms:(NSArray<TVSAlarm*>*)alarms handler:(void(^)(BOOL))handler;`

  **描述**：

  删除闹钟提醒；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | alarms | NSArray<TVSAlarm*>* | 闹钟提醒列表 | TVSAlarm 必须传 alarmId、deviceProductId、deviceGuid |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否删除成功 | 是 |

  **返回**：

  无；

## 工具(TVSUtils.h)

### TVSUtils 工具类

#### 成员

  无；

#### 方法

##### `+(void)pickGuidWithOldGuid:(NSString*)oldGuid business:(NSString*)business productId:(NSString*)productId dsn:(NSString*)dsn qua:(NSString*)qua imei:(NSString*)imei lc:(NSString*)lc mac:(NSString*)mac handler:(void(^)(NSString*))handler;`

  **描述**:

  获取 guid；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | oldGuid | NSString* | 旧的 guid | 否 |
  | business | NSString* | 业务名，一般传 BundleId | 是 |
  | productId | NSString* | 腾讯云叮当开放平台申请的产品 id | 否 |
  | dsn | NSString* | 设备序列号 | 否 |
  | qua | NSString* |  | 否 |
  | imei | NSString* |  | 否 |
  | lc | NSString* |  | 否 |
  | mac | NSString* | mac 地址 | 否 |
  | handler | void(^)(NSString*) | 回调，用于返回 guid | 是 |  

  **返回**：

  无；

##### `+(BOOL)launchMiniProgramWithUsername:(NSString*)username path:(NSString*)path type:(NSInteger)type handler:(void(^)(NSString*))handler;`

  **描述**:

  启动微信小程序；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | username | NSString* | 小程序用户名 |  是 |
  | path | NSString* | 小程序路径 | 是 |
  | type | NSString* | 小程序类型（0：正式；1：测试；2：体验） | 是 |
  | handler | NSString* |  | 是 |

  **返回**：

  是否成功；
