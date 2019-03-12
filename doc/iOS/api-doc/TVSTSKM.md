## 技能服务 <TVSTSKM/TVSTSKM.h>

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

  TVS 各领域服务统一访问接口；
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
