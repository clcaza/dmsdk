## 儿童模式 <TVSTSKM/TVSChildMode.h>

### TVSChildMode 类

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

  TVSChildMode 类实例；

##### `-(void)setConfigWithJsonBlob:(NSDictionary*)jsonBlob handler:(TVSTSKMCallback)handler;`

  **描述**:

  保存儿童模式配置；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | jsonBlob | NSDictionary* | 请求数据 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；

##### `-(void)getConfigWithJsonBlob:(NSDictionary*)jsonBlob handler:(TVSTSKMCallback)handler;`

  **描述**:

  获取儿童模式配置；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | jsonBlob | NSDictionary* | 请求数据 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；