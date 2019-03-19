# 腾讯叮当手机端SDK

| 文件夹  | 说明 |
| -------- | --------- |
| demo | 手机端 SDK 的 demo 参考 |
| doc | 手机端 SDK 文档 |
| sdk | 手机端 SDK |

## 更新日志：

### v2.0.1: :new:

* H5 新增链接加载拦截回调；
* H5 新增智能家居 H5 页面；
* 修复 H5 智能家居部分第三方页面适配问题；[iOS]
* 修复日志模块重复初始化问题；[iOS]

### [v2.0.0][2]:

* 模块化拆分，核心模块(环境配置/账号/设备绑定)为必须，H5 等模块根据需要可选；

* H5 模块由 `ViewController`/`TVSAssistActivity` 页面改为 `WebView` 组件形式，可定制化程度更高；

* H5 模块支持自己实现账号授权（不调用此 SDK 做登录和刷票）；

* 新增二维码模块，用于无屏设备账号授权；

### [v1.0][1]:

* 提供基本的账号授权、设备绑定、H5 等功能； 

[1]: https://github.com/TencentDingdang/dmsdk/tree/v1.0
[2]: https://github.com/TencentDingdang/dmsdk/tree/v2.0.0
