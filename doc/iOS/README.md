# iOS SDK 接入文档

* [SDK 接入配置指南][1];

* API 文档:

  * [环境配置 <TVSCore/TVSEnvironment.h>][2];

  * [账号授权 <TVSCore/TVSAuth.h>][3];

  * [设备绑定 <TVSCore/TVSDevice.h>][4];

  * [Web 页面 <TVSWeb/TVSWeb.h>][5];

  * [会员状态 <TVSMember/TVSMember.h>][6];

  * [技能服务 <TVSTSKM/TVSTSKM.h>][7];

  * [音色TTS <TVSSpeech/TVSSpeech.h>][8];

  * [二维码 <TVSQRCode/TVSQRCode.h>][9];
  
## iOS SDK v1.0 -> v2.0.0+ 升级指南

### 项目配置变更

v2.0.0+ SDK 做了模块化拆分，详细配置参考[接入配置指南][10];

### API 变更

#### 字符串替换

除 H5 模块外，其他模块主要是类名/方法名/参数名等变更，直接替换即可。

**头文件**:

| v1.0 | v2.0.0+ |
| ------ | ------ |
| <TVSAccountSDK/TVSAccountSDK.h> | <TVSCore/TVSCore.h> |
| <TVSAccountSDK/TVSEmvironment.h> | <TVSCore/TVSEmvironment.h> |
| <TVSAccountSDK/TVSAccount.h> | <TVSCore/TVSAuth.h> |
| <TVSAccountSDK/TVSDeviceBind.h> | <TVSCore/TVSDevice.h> |
| <TVSAccountSDK/TVSMember.h> | <TVSMember/TVSMember.h> |
| <TVSAccountSDK/TVSWebPage.h> | <TVSWeb/TVSWeb.h> |
| <TVSAccountSDK/TVSTSKM.h> | <TVSTSKM/TVSTSKM.h> |
| <TVSAccountSDK/TVSOCMS.h> | <TVSSpeech/TVSSpeech.h> |

**类名**:

| v1.0 | v2.0.0+ |
| ------ | ------ |
| TVSPushDevice | TVSDeviceInfo |
| TVSAccount | TVSAuthManager |
| TVSDeviceBind | TVSDeviceManager |
| TVSOCMS | TVSSpeech |

**属性名**:

| v1.0 | v2.0.0+ |
| ------ | ------ |
| .DSN | .dsn |

**方法名**:

| v1.0 | v2.0.0+ |
| ------ | ------ |
| -(instancetype)initWithDeviceType:(NSString*)deviceType deviceOEM:(NSString*)deviceOEM productId:(NSString*)productId DSN:(NSString*)dsn; | -(instancetype)initWithDeviceProductId:(NSString*)productId dsn:(NSString*)dsn; |
| -(void)getDeviceAISpeechWithDeviceGUID:(NSString*)deviceGUID productId:(NSString*)productId DSN:(NSString*)dsn handler:(void(^)(TVSAISpeechItem*))handler; | -(void)getDeviceAISpeechWithProductId:(NSString*)productId dsn:(NSString*)dsn handler:(void(^)(TVSAISpeechItem*))handler; |
| -(void)setDeviceAISpeechId:(NSString*)speechID productId:(NSString*)productId DSN:(NSString*)dsn handler:(void(^)(BOOL))handler; | -(void)setDeviceAISpeechId:(NSString*)speechID productId:(NSString*)productId dsn:(NSString*)dsn handler:(void(^)(BOOL))handler; |

#### H5 模块

H5 模块做了较大改动。

原来是封装的 `TVSWebViewController`，仅通过 `TVSWebPage` 提供跳转接口；虽然接入方便，但存在以下两个问题：

1. 导航栏适配问题；

2. 无法满足非全屏的场景；

因此，新版本拆分出 `TVSWebView`，既与导航栏解耦，也满足非全屏场景。

具体接入流程可参考 [demo][11] 和 [API 文档][12]。

## H5 加载失败提示实现（仅供参考）

* 使用 [AFNetworking][1] 项目的 `AFNetworkReachabilityManager` 做网络状态监听和判断；

```objective-c
- (void)monitorNetwork {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        BOOL connected = status == AFNetworkReachabilityStatusReachableViaWiFi || status == AFNetworkReachabilityStatusReachableViaWWAN;
        netStatus = connected ? 1 : -1;
        [[NSNotificationCenter defaultCenter] postNotificationName:NotifyNetworkChanged object:self userInfo:@{@"netStatus":[NSNumber numberWithInteger:netStatus]}];
        NSLog(@"NetworkChanged status:%ld netStatus:%d connected:%@", status, netStatus, connected?@"YES":@"NO");
    }];
    [mgr startMonitoring];
    }

- (BOOL)networkConnected {
    return netStatus == 1;
}
```

* 处理网络状态变更：

  1. 如果处于断开，UI 提示断网；（`AlertViewController` 或者加载自定义 View）;

  2. 如果已经重新连接，调用 `TVSWebView` 的 `reload` 方法刷新或者直接调用 `loadUrl` 方法重新加载；
  
```objective-c
-(void)onNetworkChanged:(NSNotification*)notify {
    if ([AppConfig shared].networkConnected) {
        [_webview reload];
    } else {
        [self alertDisconnected];
    }
}
```

* `TVSWebView` 遵守 `TVSWebUniversalDelegate` 协议，网页加载失败会回调 `-(void)TVSWebLoadError:(NSError*)error;` 方法，可以用来处理加载失败逻辑；

```objective-c
-(void)TVSWebLoadError:(NSError *)error {
    NSLog(@"TVSWeb load error:%@", error.localizedDescription);
    if (![[AppConfig shared] networkConnected]) {
        [self alertDisconnected];
    } else {
        [self alertLoadFailed];
    }
}
```

 
[1]: https://github.com/AFNetworking/AFNetworking



  [1]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/%E5%8E%82%E5%95%86APP(iOS)%E6%8E%A5%E5%85%A5%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8D%97.md

  [2]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSEnvironment.md

  [3]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSAuth.md

  [4]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSDevice.md

  [5]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSWeb.md

  [6]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSMember.md

  [7]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSTSKM.md

  [8]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSSpeech.md

  [9]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSQRCode.md
  
  [10]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/厂商APP(iOS)接入配置指南.md
  
  [11]: https://github.com/TencentDingdang/dmsdk/blob/master/demo/iOS/TVSAccountDemo/TVSAccountDemo/BrowserVC.m
  
  [12]: https://github.com/TencentDingdang/dmsdk/blob/master/doc/iOS/api-doc/TVSWeb.md
