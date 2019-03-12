## iOS SDK 模块介绍:

* **TVSCore.framework**: 核心模块（环境配置、账号授权、设备管理），必选； 

* **TVSMember.framework**: 会员状态查询，根据需要可选；

* **TVSQRCode.framework**: 无屏设备扫码绑定，根据需要可选；

* **TVSSpeech.framework**: 音色 TTS 配置，根据需要可选； 

* **TVSTSKM.framework**: 技能服务访问，根据需要可选；

* **TVSWeb.framework**: H5 页面，支持自己实现账号授权（须实现 `TVSAuthDelegate` 协议），根据需要可选；


## iOS SDK 更新日志：

### 2.0.0:

* 模块化拆分，核心模块(环境配置/账号/设备绑定)为必须，H5 等模块根据需要可选；

* H5 模块由 ViewController 页面改为 WebView 组件形式，可定制化程度更高；

* H5 模块支持自己实现账号授权（不调用此 SDK 做登录和刷票）；

* 新增二维码模块，用于无屏设备账号授权；

### 1.0:

* 提供基本的账号授权、设备绑定、H5 等功能； 
