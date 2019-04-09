## 设备控制 <TVSTSKM/TVSDeviceControl.h>

### TVSDeviceControl 类

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

  TVSDeviceControl 类实例；

##### `-(void)bindDeviceWithHandler:(TVSTSKMCallback)handler;`

  **描述**:

  设备绑定（APP 和设备建立通道）；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；

##### `-(NSString *)controlDeviceWithNamespace:(NSString *)nameSpace command:(NSString *)command payload:(NSDictionary *)palyload handler:(TVSTSKMCallback)handler;`

  **描述**:

  设备控制；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | namespace | NSString* | 操作域 | 是 |
  | command | NSString* | 操作指令 | 是 |
  | payload | NSDictionary* | 操作参数 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  操作唯一串；