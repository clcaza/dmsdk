## 设备管理 <TVSCore/TVSDevice.h>

### 常量

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| PUSH_ID_EXTRA_SDK_SPEAKER | NSString* | SDK 接入方案的音箱绑定时需要传入的 pushIdExtra 常量 |
| PUSH_ID_EXTRA_TVS_SPEAKER | NSString* | 云端 API 接入方案的音箱绑定时需要传入的 pushIdExtra 常量 |

### TVSDeviceBindType 设备绑定类型枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSDeviceBindTypeSDKApp | SDK 接入方案的 App |
| TVSDeviceBindTypeSDKSpeaker | SDK 接入方案的音箱 |
| TVSDeviceBindTypeTVSApp | 云端 API 接入方案的 App |
| TVSDeviceBindTypeTVSSpeaker | 云端 API 接入方案的音箱 |

### TVSDeviceInfo 设备信息实体类

#### 成员

| 名称 | 类型 | 描述 |
| ------ | ------ | ------ |
| productId | NSString* | TVS 后台申请的 appid/accessToken 信息 |
| dsn | NSString* | 设备序列号 |
| pushId | NSString* | 用于 push 的标识 |
| pushIdExtra | NSString* | pushId 扩展字段 |
| guid | NSString* | 全局唯一标识 |
| deviceId | NSString* | 设备标识 |
| deviceName | NSString* | 设备名 |
| deviceType | NSString* | 设备类型 |
| deviceSerial | NSString* | 设备系列 |
| deviceOEM | NSString* | 设备厂商 |
| deviceOEMUrl | NSString* | 设备厂商 logo url |
| deviceOEMToken | NSString* | 设备厂商 token(用于 PushKit) |
| deviceMark | NSString* | 设备备注 |
| QUA | NSString* |  |
| IMEI | NSString* |  |
| LC | NSString* |  |
| MAC | NSString* | MAC 地址 |
| QIMEI | NSString* |  |
| enrollTime | long long | 注册时间 |
| bindTime | long long | 绑定时间 |
| extra | NSDictionary* | 扩展信息字典 |
| businessExtra | NSDictionary* | 业务扩展信息字典 |
| accountInfo | TVSAccountInfo* | 账号信息 |

#### 方法

  无；

### TVSDeviceManager 设备管理类

#### 成员

  无；

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获取设备管理类实例对象;

  **参数**:

  无;

  **返回**：

  设备管理类实例；

##### `-(void)preBindScreenDevice:(TVSDeviceInfo*)device cancel:(BOOL)cancel handler:(void(^)(BOOL))handler;`

  **描述**：

  有屏设备预绑定；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | device | TVSDeviceInfo* | 设备信息 | 其中 productId、dsn、bindType 必须填，其他字段根据需要透传；绑定 Speaker 设备时还必须传 pushIdExtra 字段（取值为 PUSH_ID_EXTRA_SDK_SPEAKER 或 PUSH_ID_EXTRA_TVS_SPEAKER 常量）； |
  | cancel | BOOL | 是否取消 | 是 |
  | handler | void(^)(BOOL) | 回调，BOOL 值表示是否预绑定成功 | 是 |

  **返回**：

  无；

##### `-(void)bindDevice:(TVSDeviceInfo*)device handler:(void(^)(BOOL))handler;`

  **描述**：

  绑定设备；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | device | TVSDeviceInfo* | 设备信息 | 其中 productId、dsn、bindType 必须填，其他字段根据需要透传；绑定 Speaker 设备时还必须传 pushIdExtra 字段（取值为 PUSH_ID_EXTRA_SDK_SPEAKER 或 PUSH_ID_EXTRA_TVS_SPEAKER 常量）； |
  | handler | void(^)(BOOL) | 回调，BOOL 标识是否绑定成功 | 是 |

  **返回**：

  无；

##### `-(void)unbindDevice:(TVSDeviceInfo*)device handler:(void(^)(BOOL))handler;`

  **描述**：

  解绑设备；
  必须确保已登录！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | device | TVSDeviceInfo* | 设备信息 | 其中 productId、dsn、bindType 必须填，其他字段根据需要透传；解绑 Speaker 设备时还必须传 pushIdExtra 字段（取值为 PUSH_ID_EXTRA_SDK_SPEAKER 或 PUSH_ID_EXTRA_TVS_SPEAKER 常量）； |
  | handler | void(^)(BOOL) | 回调，BOOL标识是否解绑成功 | 是 |

  **返回**：

  无；

##### `-(void)queryDevicesByGuid:(NSString*)guid bindType:(TVSDeviceBindType)bindType handler:(void(^)(NSArray<TVSDeviceInfo*>*))handler;`

  **描述**：

  通过 guid 查询设备列表；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | guid | NSString* | guid | 是 |
  | bindType | TVSDeviceBindType | 设备绑定类型 | 是 |
  | handler | void(^)(NSArray<TVSDeviceInfo*>*) | 回调，返回设备信息列表 | 是 |

  **返回**：

  无；

##### `-(void)queryDevicesByProductId:(NSString*)productId dsn:(NSString*)dsn bindType:(TVSDeviceBindType)bindType handler:(void(^)(NSArray<TVSDeviceInfo*>*))handler;`

  **描述**：

  通过 productId/dsn 查询设备列表；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | productId | NSString* | 设备 productId | 是 |
  | dsn | NSString* | 设备序列号 | 是 |
  | bindType | TVSDeviceBindType | 设备绑定类型 | 是 |
  | handler | void(^)(NSArray<TVSDeviceInfo*>*) | 回调，返回设备信息列表 | 是 |

  **返回**：

  无；

##### `-(void)queryDevicesByAccountWithBindType:(TVSDeviceBindType)bindType handler:(void(^)(NSArray<TVSDeviceInfo*>*))handler;`

  **描述**：

  通过账号查询设备列表；
  必须确保已登录！！

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | bindType | TVSDeviceBindType | 设备绑定类型 | 是 |
  | handler | void(^)(NSArray<TVSDeviceInfo*>*) | 回调，返回设备信息列表 | 是 |

  **返回**：

  无；

##### `-(void)queryAccountWithDevice:(TVSDeviceIndo*)device handler:(void(^)(TVSAccountInfo*))handler;`

  **描述**：

  根据设备信息反查绑定的账号信息；

  **参数**：

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | device | TVSDeviceInfo* | 设备信息 | 其中 productId、dsn、bindType 必须填，其他字段根据需要透传；查询 Speaker 设备时还必须传 pushIdExtra 字段（取值为 PUSH_ID_EXTRA_SDK_SPEAKER 或 PUSH_ID_EXTRA_TVS_SPEAKER 常量）； |
  | handler | void(^)(TVSAccountInfo*) | 回调，返回账号信息 TVSAccountInfo，具体字段定义详见账号管理部分  | 是 |

  **返回**：

  无；
