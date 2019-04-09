## 技能服务 <TVSTSKM/TVSTSKMProxy.h>

### TVSTSKMProxy 技能服务访问代理类

#### 成员

 无；

#### 方法

##### `-(instancetype)initWithDeviceInfo:(TVSDeviceInfo*)deviceInfo accountInfo:(TVSAccountInfo*)accountInfo;`

  **描述**:

  实例化（适用于QQ/微信登录）；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | deviceInfo | TVSDeviceInfo* | 设备信息 | 是 | 其中 productId 必填，dsn 和 guid 二选一 |
  | accountInfo | TVSAccountInfo* | 账号信息 | 是 | 如果自己做账号授权，需要手动注入；否则传 nil |

  **返回**:

  TVSTSKMProxy 实例；

##### `-(instancetype)initWithDeviceInfo:(TVSDeviceInfo*)deviceInfo accountId:(NSString *)accountId;`

  **描述**:

  实例化（适用于其他账号登录）；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 | 备注 |
  | ------ | ------ | ------ | ------ | ------ |
  | deviceInfo | TVSDeviceInfo* | 设备信息 | 是 | 其中 productId 必填，dsn 和 guid 二选一 |
  | accountId | NSString* | 账号唯一 ID | 是 |  |

  **返回**:

  TVSTSKMProxy 实例；