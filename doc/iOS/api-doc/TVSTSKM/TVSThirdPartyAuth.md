## 第三方授权 <TVSTSKM/TVSThirdPartyAuth.h>

### TVSThirdPartyAuth 类

#### 成员

 无；

#### 方法

##### `-(instancetype)initWithTSKMProxy:(TVSTSKMProxy*)tskmProxy;`

  **描述**:

  初始化方法；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | tskmProxy | TVSTSKMProxy* | 技能服务访问代理 | 是 |

  **返回**:

  TVSThirdPartyAuth 类实例；

##### `+(NSString*)urlWithAccountType:(TVSAccountType)accountType productId:(NSString*)productId dsn:(NSString*)dsn deviceGuid:(NSString*)deviceGuid;`

  **描述**:

  获取跳转链接;

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | accountType | TVSAccountType | 账号类型 | 是 |  |
  | productId | NSString* | ProductId | 是 |  |
  | dsn | NSString* | 设备序列号 | 是 |  |
  | deviceGuid | NSString* | 设备 guid | 是 | 通过设备查询接口获得 |

  **返回**:

  跳转链接；

##### `-(void)setBinded:(BOOL)binded accountInfo:(TVSAccountInfo*)accountInfo deviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(BOOL))handler;`

  **描述**：

  第三方账号和设备信息绑定开关；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | binded | BOOL | 是否绑定 | 是 |  |
  | accountInfo | TVSAccountInfo* | 第三方账号信息 | 是 | accountType、appId、openId、accessToken必填 |
  | deviceInfo | TVSDeviceInfo* | 设备信息 | 是 | productId、dsn、guid必填 |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否调用成功 | 是 |  |

  **返回**：

  无；

##### `-(void)getBindedAccountInfoWithDeviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(TVSAccountInfo*))handler;`

  **描述**：

  通过设备信息查询绑定的第三方账号信息

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | deviceInfo | TVSDeviceInfo* | 设备信息 | 是 | productId、dsn、guid必填 |
  | handler | void(^)(TVSAccountInfo*) | 回调，TVSAccountInfo* 表示查询到的账号信息 | 是 |  |

  **返回**：

  无；
