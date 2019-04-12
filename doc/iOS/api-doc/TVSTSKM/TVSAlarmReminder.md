## 闹钟管理 <TVSTSKM/TVSAlarmReminder.h>

### TVSAlarmReminder 类

#### TVSAlarmReminderOperation 枚举

| 名称 | 描述 |
| ------ | ------ |
| TVSAlarmReminderOperationManage | 管理 |
| TVSAlarmReminderOperationSyncData | 同步数据 |
| TVSAlarmReminderOperationClearData | 清数据 |

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

  TVSAlarmManager 类实例；

##### `-(void)alarmOperation:(TVSAlarmReminderOperation)op blob:(NSDictionary*)blob handler:(TVSTSKMCallback)handler;`

  **描述**:

  管理闹钟；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | op | TVSAlarmReminderOperation | 操作 | 是 |
  | blob | NSDictionary* | 请求数据 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；

##### `-(void)reminderOperation:(TVSAlarmReminderOperation)op blob:(NSDictionary*)blob handler:(TVSTSKMCallback)handler;`

  **描述**:

  管理提醒；

  **参数**:

  | 名称 | 类型 | 描述 | 是否必填 |
  | ------ | ------ | ------ | ------ |
  | op | TVSAlarmReminderOperation | 操作 | 是 |
  | blob | NSDictionary* | 请求数据 | 是 |
  | handler | TVSTSKMCallback | 回调 | 是 |

  **返回**:

  无；