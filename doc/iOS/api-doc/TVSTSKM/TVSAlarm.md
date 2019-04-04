## 闹钟管理 <TVSTSKM/TVSAlarm.h>

### TVSAlarm 类

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

  TVSAlarm 类实例；

##### `-(void)manageWithJsonBlob:(NSDictionary*)jsonBlob handler:(TVSTSKMCallback)handler;`

  **描述**:

  管理闹钟；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | jsonBlob | NSDictionary* | 请求数据 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；