## 第三方授权 <TVSTSKM/TVSThirdPartyAuth.h>

### TVSThirdPartyAuth 类

#### 成员

 无；

#### 方法

##### `+(void)gotoAuthWithAccountInfo:(nullable TVSAccountInfo*)accountInfo deviceInfo:(TVSDeviceInfo*)deviceInfo handler:(void(^)(BOOL))handler;`

  **描述**:

  跳转到云叮当 APP 进行第三方授权;

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | accountInfo | TVSAccountInfo* | 账号信息 | 使用本 SDK 做账号登录的传 nil |  |
  | deviceInfo | TVSDeviceInfo* | 设备信息 | 是 | 其中 productId、dsn、guid 必填！！ |
  | handler | void(^)(BOOL) | 回调，BOOL 表示是否成功 | 是 |  |

  **返回**:

  无；
