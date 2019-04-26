## 环境变量 <TVSCore/TVSEnvironment.h>

### TVSServerEnv 后台环境枚举

| 名称 | 描述 | 备注 |
| ------ | ------ | ------ |
| TVSServerEnvFormal | 正式环境 | 默认 |
| TVSServerEnvExplore | 体验环境 |  |
| TVSServerEnvTest | 测试环境 |  |
| TVSServerEnvDev | 开发环境 | 暂不对外开放 |

### TVSEnvironment 环境变量类

#### 成员

 | 名称 | 类型 | 描述 | 备注 |
 | ------ | ------ | ------ | ------ |
 | serverEnv | TVSServerEnv | 后台环境 | 默认正式环境 |
 | serverReqTimeout | NSTimeInterval | 后台请求超时时间 | 默认 10 秒 |

#### 方法

##### `+(instancetype)shared;`

  **描述**:

  获取 TVSEnvironment 实例对象；

  **参数**:

  无;

  **返回**:

  TVSEnvironment 实例；

##### `-(void)enableLog;`

  **描述**:

  开启日志；

  **参数**:

  无；

  **返回**:

  无；

##### `-(NSString*)sdkVersion;`

  **描述**:

  获取 SDK 版本；

  **参数**:

  无；

  **返回**:

  SDK 版本；