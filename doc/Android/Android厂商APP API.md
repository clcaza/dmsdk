# Android厂商APP API #
## LoginProxy ##
&emsp;帐号和设备管理功能代理类</br>
### getInstance ###
&emsp;获取LoginProxy实例</br>
<pre><code>static LoginProxy getInstance(String appIdWx, String appIdQQOpen, Context context)</code></pre>

#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  appIdWx | String | <p>微信开放平台申请的appId</p>|
|  appIdQQOpen | String | <p>QQ互联平台申请的appId</p>|
|  context | String | <p>应用Application Context</p>|

### getInfoManager ###
&emsp;获取LoginInfoManager实例</br>
<pre><code>LoginInfoManager getInfoManager(ELoginPlatform platform)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|

### requestLogin ###
&emsp;请求登录</br>
<pre><code>void requestLogin(ELoginPlatform platform, String productId, String dsn, Activity activity)</code></pre>

#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  productId | String | <p>设备的productId</p>|
|  dsn | String | <p>设备的序列号</p>|
|  activity | Activity | <p>登录Activity实例</p>|

### requestLogin ###
&emsp;请求登录</br>
<pre><code>void requestLogin(ELoginPlatform platform, Activity activity)</code></pre>

#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  activity | Activity | <p>登录Activity实例</p>|

### requestTokenVerify ###
&emsp;请求验票刷票</br>
<pre><code>void requestTokenVerify(ELoginPlatform platform, String productId, String dsn)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  productId | String | <p>设备的productId</p>|
|  dsn | String | <p>设备的序列号</p>|

### requestTokenVerify ###
&emsp;请求验票刷票</br>
<pre><code>void requestTokenVerify(ELoginPlatform platform)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|

### registerProduct ###
&emsp;注册productId，匹配设置APP里个人中心样式</br>
<pre><code>void registerProduct(String productId)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  productId | String | <p>设备的productId</p>|

### requestQRAuth ###
&emsp;请求有屏设备QQ音乐帐号绑定二维码登录</br>
<pre><code>void requestQRAuth(QRAuthInfo qrAuthInfo, UserCenterStateListener stateListener, ProxyDataListener dataListener, MotionEventListener motionEventListener, DeviceManager deviceManager, ELoginEnv env)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  qrAuthInfo | QRAuthInfo | <p>主账号基本信息结构体</p>|
|  stateListener | UserCenterStateListener | <p>H5页面主账号行为回调监听器</p>|
|  dataListener | ProxyDataListener | <p>前端与终端SDK数据透传通道回调监听器</p>|
|  motionEventListener | MotionEventListener | <p>H5页面触摸事件回调监听器</p>|
|  deviceManager | DeviceManager | <p>设备管理器</p>|
|  env | ELoginEnv | <p>网络环境</p>|

### requestWebAuth ###
&emsp;请求无屏设备QQ音乐帐号登录</br>
<pre><code>void requestWebAuth(UserCenterStateListener stateListener, ProxyDataListener dataListener, MotionEventListener motionEventListener, ELoginEnv env)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  stateListener | UserCenterStateListener | <p>H5页面主账号行为回调监听器</p>|
|  dataListener | ProxyDataListener | <p>前端与终端SDK数据透传通道回调监听器</p>|
|  motionEventListener | MotionEventListener | <p>H5页面触摸事件回调监听器</p>|
|  env | ELoginEnv | <p>网络环境</p>|

### isTokenExist ###
&emsp;判断Token信息存在与否</br>
<pre><code>boolean isTokenExist(ELoginPlatform platform, Context context)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  context | Context | <p>应用Application Context</p>|

#### clearToken ####
&emsp;清除Token信息，用于注销</br>
<pre><code>void clearToken(ELoginPlatform platform, Context context)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  context | Context | <p>应用Application Context</p>|

### setOwnActivity ###
&emsp;设置H5页面跳转接口调用所属的Activity（需要统一用DMSDK里跳转动画时才需要调用）</br>
<pre><code>void setOwnActivity(Activity activity)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  activity | Activity | <p>传入用于授权后回调的Activity</p>|

### setAuthorizeListener ###
&emsp;设置帐号相关信息的监听器</br>
<pre><code>void setAuthorizeListener (AuthorizeListener listener)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  listener | AuthorizeListener实例 | <p>AuthorizeListener实例</p>|

### setBindingListener ###
&emsp;设置绑定信息监听器</br>
<pre><code>void setBindingListener(BindingListener listener)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  listener | BindingListener | <p>BindingListener实例</p>|

### initNetEnv ###
&emsp;初始化读取当前已设置的后台环境</br>
<pre><code>void initNetEnv()</code></pre>

### setLoginEnv ###
&emsp;设置帐号绑定后台环境</br>
<pre><code>void setLoginEnv(ELoginEnv env)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  env | ELoginEnv | <p>帐号后台环境类型</p>|

### setUserCenterEnv ###
&emsp;设置H5页面网络环境</br>
<pre><code>void setUserCenterEnv(ELoginEnv env)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  env | ELoginEnv | <p>H5页面网络环境类型</p>|

### handleQQOpenIntent ###
&emsp;QQ登录帐号信息回调</br>
<pre><code>void handleQQOpenIntent(int requestCode, int resultCode, Intent data)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  requestCode | int | <p>Activity跳转请求Code，确认返回数据是哪个Activity的</p>|
|  resultCode | int | <p>应子Activity通过setResult返回的code</p>|
|  data | Intent | <p>Intent对象，带有返回的数据</p>|

### handleQQOpenUserInfo ###
&emsp;QQ登录用户信息回调</br>
<pre><code>void handleQQOpenIntent()</code></pre>
### getClientId ###
&emsp;获取用于与设备进行通信的帐号和设备信息</br>
<pre><code>String getClientId(ELoginPlatform platform)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|

### getUserId ###
&emsp;获取用户Id</br>
<pre><code>String getUserId()</code></pre>

### tvsOpenMiniProgram ###
&emsp;拉起小程序接口</br>
<pre><code>void tvsOpenMiniProgram(MiniProgManager manager, MiniProgCallback callback)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  manager | MiniProgManager | <p>小程序信息管理类</p>|
|  callback | MiniProgCallback | <p>小程序跳转回调</p>|


### requestGetCaptcha ###
&emsp;获取手机号短信验证码</br>
<pre><code>void requestGetCaptcha(ELoginPlatform platform, String phoneNumber)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  phoneNumber | String | <p>需要绑定的手机号</p>|
### requestBindPhoneNumber ###
&emsp;绑定手机号</br>
<pre><code>void requestBindPhoneNumber(ELoginPlatform platform, String phoneNumber, String captcha)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  phoneNumber | String | <p>需要绑定的手机号</p>|
|  captcha | String | <p>短信验证码</p>|


### toUserCenter ###
&emsp;跳转用户中心页面（不带回调）</br>
<pre><code>void toUserCenter(EUserAttrType type, DeviceManager deviceManager)</code></pre>

#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | EUserAttrType | <p>H5页面类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### toUserCenter ###
&emsp;跳转用户中心页面（带回调）</br>
<pre><code>void toUserCenter(EUserAttrType type, DeviceManager deviceManager, UserCenterStateListener listener)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | EUserAttrType | <p>H5页面类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
|  listener | UserCenterStateListener | <p>用户中心帐号状态回调</p>|
### requestSetPushMapInfoEx ###
&emsp;设置推送绑定接口</br>
<pre><code>void requestSetPushMapInfoEx(ELoginPlatform platform, PushInfoManager pushInfoManager, DeviceManager deviceManager)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  pushInfoManager | PushInfoManager | <p>推送信息管理器</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
### requestDelPushMapInfo ###
&emsp;解除设备推送绑定接口</br>
<pre><code>void requestDelPushMapInfo(ELoginPlatform platform, PushInfoManager pushInfoManager, DeviceManager deviceManager)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  pushInfoManager | PushInfoManager | <p>推送信息管理器</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
### requestGetPushDeviceInfo ###
&emsp;查询当前帐号绑定设备接口</br>
<pre><code>void requestGetPushDeviceInfo(ELoginPlatform platform)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|

### requestGetBoundAcctByPushInfo ###
&emsp;获取指定设备上绑定的帐号信息接口</br>
<pre><code>void requestGetBoundAcctByPushInfo(ELoginPlatform platform, PushInfoManager pushInfoManager, DeviceManager deviceManager)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|
|  pushInfoManager | PushInfoManager | <p>推送信息管理器</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### readLoginInfo ###
&emsp;读取手机里帐号信息缓存到LoginInfoManager里</br>
<pre><code>void readLoginInfo(Context context, ELoginPlatform platform)</code></pre>
#### 参数

| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  context | Context | <p>应用Application Context</p>|
|  platform | ELoginPlatform | <p>帐号平台类型</p>|

### tvsOpenUrl ###
&emsp;直接打开URL接口</br>
<pre><code>void tvsOpenUrl(String url)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  url | String | <p>链接URL地址</p>|

### tvsOpenUrlWithCallback ###
&emsp;带回调的形式打开URL接口</br>
<pre><code>tvsOpenUrlWithCallback(String url, UserCenterStateListener stateListener, ProxyDataListener dataListener)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  url | String | <p>链接URL地址</p>|
|  stateListener | UserCenterStateListener | <p>H5页面账号行为回调监听器</p>|
|  dataListener | ProxyDataListener | <p>前端与终端SDK数据透传通道回调监听器</p>|

### tvsRequestUrl ###
&emsp;带回调请求URL页面</br>
<pre><code>void tvsRequestUrl(String url, UserCenterStateListener stateListener, ProxyDataListener dataListener, MotionEventListener motionEventListener)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  url | String | <p>链接URL地址</p>|
|  stateListener | UserCenterStateListener | <p>H5页面账号行为回调监听器</p>|
|  dataListener | ProxyDataListener | <p>前端与终端SDK数据透传通道回调监听器</p>|
|  motionEventListener | MotionEventListener | <p>H5页面触摸事件回调监听器</p>|

### tvsRequestUrl ###
&emsp;带回调请求URL页面</br>
<pre><code>void tvsRequestUrl(String url, UserCenterStateListener stateListener, ProxyDataListener dataListener, MotionEventListener motionEventListener, DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  url | String | <p>链接URL地址</p>|
|  stateListener | UserCenterStateListener | <p>H5页面账号行为回调监听器</p>|
|  dataListener | ProxyDataListener | <p>前端与终端SDK数据透传通道回调监听器</p>|
|  motionEventListener | MotionEventListener | <p>H5页面触摸事件回调监听器</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### tvsExecJS ###
&emsp;请求执行JS方法（需与前端协定好接口）</br>
<pre><code>void tvsExecJS(String funcName, String funcParam, String h5Id)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  funcName | String | <p>JS方法名</p>|
|  funcParam | String | <p>funcName里的参数</p>|
|  h5Id | String | <p>请求ID</p>|

### tvsExecJSV2 ###
&emsp;带返回码的请求执行JS方法V2版（需与前端协定好接口）</br>
<pre><code>void tvsExecJSV2(String funcName, int retCode, String funcParam, String h5Id)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  funcName | String | <p>JS方法名</p>|
|  retCode | int | <p>JS方法执行返回码</p>|
|  funcParam | String | <p>funcName里的参数</p>|
|  h5Id | String | <p>请求ID</p>|

### tvsDismissAssist ###
&emsp;请求关闭DM前端H5</br>
<pre><code>void tvsDismissAssist()</code></pre>

### getMemberStatus ###
&emsp;获取设备领取会员信息接口</br>
<pre><code>void getMemberStatus(ELoginPlatform platform, DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### getDeviceStatus ###
&emsp;获取设备会员状态接口</br>
<pre><code>void getDeviceStatus(ELoginPlatform platform, DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### manageAcct ###
&emsp;票据获取和刷新接口</br>
<pre><code>void manageAcct(ELoginPlatform platform, DeviceManager deviceManager, String operType, String operParam)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
|  operType | String | <p>接口操作类型</p>|
|  operParam | String | <p>接口操作JSON数据</p>|

### requestGetBotAISpeechOption ###
&emsp;获取当前ProductID下可支持的TTS音色列表</br>
<pre><code>void requestGetBotAISpeechOption(DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|

### requestSetDeviceAISpeech ###
&emsp;设置当前ProductID下的TTS</br>
<pre><code>void requestGetBotAISpeechOption(DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
|  speechID | String | <p>TTS音色ID</p>|

### requestGetDeviceAISpeech ###
&emsp;获取当前ProductID下音色ID</br>
<pre><code>void requestGetBotAISpeechOption(DeviceManager deviceManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|


### requestAlarmManagement ###
&emsp;云端闹钟管理V1接口</br>
<pre><code>requestAlarmManagement(ELoginPlatform platform, AlarmBusiness business)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  business | AlarmBusiness | <p>闹钟业务数据结构体</p>|

### requestTskmUniAccess ###
&emsp;云端闹钟管理V2接口</br>
<pre><code>requestTskmUniAccess(ELoginPlatform platform, DeviceManager deviceManager, UniAccessInfo uniAccessInfo)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号平台类型</p>|
|  deviceManager | DeviceManager | <p>设备信息管理器</p>|
|  uniAccessInfo | UniAccessInfo | <p>通用接口数据结构体</p>|

### isWXAppInstalled ###
&emsp;判断手机是否安装微信</br>
<pre><code>boolean isWXAppInstalled()</code></pre>
### tvsAuth ###
&emsp;请求授权到叮当平台（包括微信授权、刷票；QQ授权）</br>
<pre><code>void tvsAuth(ELoginPlatform platform, String acctRet)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  acctRet | String | <p>官方授权返回Json字段</p>|

### tvsSetUser ###
&emsp;简要接口时设置登录帐号的用户信息</br>
<pre><code>void tvsSetUser(ELoginPlatform platform, String userRet)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  acctRet | String | <p>官方请求用户信息返回Json字段</p>|


### tvsQQOpenVerify ###
&emsp;请求验证QQ互联登录票据</br>
<pre><code>void tvsQQOpenVerify(String appId, String openID, String accessToken)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  appid | String | <p>QQ互联AppId</p>|
|  openID | String | <p>QQ互联登录的OpenID</p>|
|  accessToken | String | <p>QQ互联登录的票据信息</p>|


### requestGetDeviceInfoList ###
&emsp;根据用户OpenId或设备guid查询绑定列表</br>
<pre><code>void requestGetDeviceInfoList(ELoginPlatform platform, int queryDeviceType, String deviceGUID, PushInfoManager pushInfoManager)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  queryDeviceType | int | <p>查询类型</p>|
|  deviceGUID | String | <p>设备GUID，如果根据用户来查找可以置空</p>|
|  pushInfoManager | PushInfoManager | <p>Push信息管理器</p>|


## LoginInfoManager ##
&emsp;登录信息管理类，被WxInfoManager和QQOpenInfoManager继承。</br></br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| accessToken | String | 授权登录的AccessToken |
| refreshToken | String | 授权登录的RefreshToken |
| openID | String | 用户的OpenID |
| expireTime | long | AccessToken的有效期 |
| tvsID| String | 授权叮当后请求到的叮当ID |
| appId| String | 叮当登录的微信或QQ的AppId |
| manageAcctOperType| String | manageAcct帐号操作类型 |


## CommOpInfo ##
&emsp;网络调用结果信息管理类，当网络超时或无响应时该对象在AuthrizeListener里为空</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| retCode | int | 错误返回码 |
| errMsg | String | 后台返回错误信息 |
| commOpExtraInfo | CommOpExtraInfo | 网络返回额外信息结构体 |

## AuthorizeListener ##
&emsp;票据验证监听器</br>
### onSuccess ###
&emsp;接口调用成功回调，用于UI更新</br>
<pre><code>void onSuccess(int type, CommOpInfo commOpInfo);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | String | <p>帐号操作类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

### onError ###
&emsp;接口调用失败回调，用于UI更新</br>
<pre><code>void onError(int type, CommOpInfo commOpInfo);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | String | <p>帐号操作类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

### onCancel ###
&emsp;登录接口取消调用回调，用于UI更新</br>
<pre><code>void onCancel(int type);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | String | <p>帐号操作类型</p>|

| 类型     | 说明       |
|:---------|:-----------|
|AUTH_TYPE|微信授权票据类型|
|REFRESH_TYPE|微信刷新票据类型|
|WX_TVSIDRECV_TYPE|微信叮当ID接收类型|
|QQOPEN_TVSIDRECV_TYPE|QQ 叮当ID接收类型|
|TOKENVERIFY_TYPE|QQ帐号AccessToken验证类型|
|USERINFORECV_TYPE|用户信息获取类型|
|WX_VALID_LOGIN_TYPE|微信合法登录类型|
|QQOPEN_VALID_LOGIN_TYPE|QQ合法登录类型|
|MANAGEACCT_TYPE|QQ 帐号操作类型|
|ALARMMANAGEMENT_TYPE|云端闹钟操作管理类型|
|UNIACCESS_TYPE|云端闹钟操作管理V2类型|
## EloginPlatform ##
&emsp;登录帐号类型枚举</br>

| 枚举值     | 说明       |
|:---------|:-----------|
|WX|微信帐号|
|QQOpen|QQ互联帐号|

## EloginEnv ##
&emsp;帐号后台环境配置</br>

| 枚举值     | 说明       |
|:---------|:-----------|
|FORMAL|正式环境|
|TEST|测试环境|
|EX|体验环境|

## UserInfoManager ##
&emsp;用户信息管理类</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| idType | int | 帐号类型0微信1QQ |
| nickName | String | 昵称 |
| headImgUrl | String |头像URL地址 |
| phoneNumber | String | 绑定的手机号 |
| sex | int | 帐号性别 |

### getInstance ###
&emsp;获取UserInfoManager实例</br>
<pre><code>static UserInfoManager getInstance()</code></pre>

## BindingListener ##
&emsp;用户信息绑定监听器</br>

### onSuccess ###
用户信息绑定接口调用成功回调，用于UI更新
<pre><code>void onSuccess(int type, CommOpInfo commOpInfo);</code></pre>

#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | String | <p>帐号操作类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

### onError ###
用户信息绑定接口调用失败回调，用于UI更新
<pre><code>void onError(int type, CommOpInfo commOpInfo);</code></pre>

#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  type | String | <p>帐号操作类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

| 类型     | 说明       |
|:---------|:-----------|
|GET_CAPTCHA_TYPE|获取短信验证码类型|
|BIND_PHONENUMBER_TYPE|绑定手机号类型|
|SET_PUSH_MAP_INFOEX_TYPE|设备绑定类型|
|DEL_PUSH_MAP_INFO_TYPE|设备解绑类型|
|GET_PUSH_DEVICE_INFO_TYPE|获取绑定设备列表类型|
|GET_BOUND_ACCT_BY_PUSH_INFO_TYPE|通过设备信息获取绑定帐号类型|
|BIND_GET_MEMBER_STATUS_TYPE|绑定设备领取会员状态查询类型|
|BIND_GET_DEVICE_STATUS_TYPE|获取设备会员状态有效期类型|
|GET_BOT_AI_SPEECH_OPTION_TYPE|获取ProductID支持TTS音色列表类型|
|SET_DEVICE_AI_SPEECH_TYPE|设置设备TTS音色|
|GET_DEVICE_AI_SPEECH_TYPE|获取设备上TTS音色|
|GET_DEVICE_INFOLIST_TYPE|获取绑定设备列表类型|


## PushInfoManager ##
&emsp;推送信息管理类</br>

### getInstance ###
&emsp;获取PushInfoManager实例</br>
<pre><code>static PushInfoManager getInstance()</code></pre>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| id | String | 推送ID |
| idExtra | String | 推送额外信息 |
| idType | int | 推送类型 |

## DeviceManager ##
&emsp;设备信息管理类</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| ip | String | 设备目标 |
| data | String | 设备信息JSON数据 |
| qua | String | 设备QUA |
| guid | String | 设备GUID |
| imei | String | 设备IMEI |
| licence | String | 设备licence |
| mac | String | 设备qimei |
| qimei | String | 设备QUA |
| os | String | 设备操作系统 |
| deviceOEMUrl | String | 品牌Icon |
| deviceOEM | String | 品牌名称 |
| deviceType| String | 设备类型 |
| deviceSerial | String | 设备序列号 |
| deviceMark | String | 设备备注 |
| deviceId | String | 设备ID |
| deviceName | String | 设备名称 |
| manufacturer | String | 设备制造商 |
| packageName | String | 设备主包名 |
| isBinded | boolean | 是否绑定过 |
| bindOpenId | String | 绑定的帐号OpenID |
| bindAccountType | int | 绑定的帐号类型 |
| bindTime | long | 绑定时间 |
| enrollTime | long | 注册时间 |
| productId | String | 叮当标准信息设备ID |
| dsn | String | 叮当标准信息设备序列号 |

## EUserAttrType ##
&emsp;用户中心类型枚举</br>

| 枚举值     | 说明       |
|:---------|:-----------|
|HOMEPAGE|主页|
|CPOPERATION|运营页面|
|INFOSETTING|常用信息设置页面|
|AGREEMENT|声明页面|
|PRIVACY|隐私协议页面|
|FEEDBACK|反馈页面|

## UserCenterStateListener ##
&emsp;用户中心帐号状态类型回调</br>
### onSuccess ###
&emsp;成功回调，用于UI更新</br>
<pre><code>void onSuccess(ELoginPlatform platform, int type, CommOpInfo commOpInfo);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  type | String | <p>帐号操作类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

### onError ###
&emsp;失败回调，用于UI更新</br>
<pre><code>void onError(int type, CommOpInfo commOpInfo)</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

### onCancel ###
&emsp;取消回调，用于UI更新</br>
<pre><code>void onCancel(int type, CommOpInfo commOpInfo);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  platform | EPlatform | <p>帐号类型</p>|
|  commOpInfo | CommOpInfo | <p>调用结果信息</p>|

| 类型     | 说明       |
|:---------|:-----------|
|LOGIN_TYPE|登录状态类型|
|LOGOUT_TYPE|注销状态类型|
|REFRESH_TYPE|刷票类型|

## ProxyDataListener ##
&emsp;前端与终端SDK数据透传通道回调监听器
### onDataRecv ###
&emsp;收到前端数据回调接口，返回true表示收到回调后关闭页面，false不关闭页面</br>
<pre><code>boolean onDataRecv(JSONObject data);</code></pre>
#### 参数
| 名称     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
|  data | JSONObject | <p>前端JSON数据</p>|

## MotionEventListener ##
&emsp;H5页面触摸事件回调监听器</br>
### onMotionDown ###
&emsp;触摸touchdown事件回调</br>
<pre><code>void onMotionDown();</code></pre>

## ProductManager ##
### getInstance ###
&emsp;获取ProductManager实例</br>
<pre><code>static ProductManager getInstance()</code></pre>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| pushDeviceInfos | ArrayList | 帐号下绑定设备的列表缓存 |
| aiAcctInfo | AIAcctInfo | 返回设备对应的帐号信息 |
| currAISpeechItem | AISpeechItem | 当前TTS音色信息 |
| supportAISpeechItems | ArrayList | 当前ProductID支持的TTS音色列表 |
| alarmBusiness | AlarmBusiness | 闹钟V1协议事务数据 |
| boundDeviceInfoList | ArrayList<DeviceInfo> | 绑定设备信息列表 |

## AIAcctInfo ##
&emsp;用于获取查询云端绑定对应帐号信息的结构体类</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| eAcctType | int | 帐号类型（微信：EAcctType._EWechatOpenId QQ：EAcctType._EQQOpenId）|
| strAcctId | String |帐号的OpenID |
| strAcctAppId | String | 帐号的AppId |

## AISpeechItem ##
&emsp;TTS音色结构体</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| strSpeechID | String | TTS音色ID |
| strSpeechName | String | TTS音色名称 |
| strIsDefaultOption | String | 是否为默认TTS音色 |

## QRAuthInfo ##
&emsp;扫码登录页面主账号信息结构体类</br>

| 成员变量     | 类型       | 说明                           |
|:---------|:-----------|:--------------------------------------|
| platform | ELoginPlatform | 主账号平台类型 |
| appId|String| 主账号APPID |
| openId|String| 主账号OpenId |
| accessToken| String | 主账号AccessToken |
| refreshToken | String | 主账号RefreshToken |
| tvsId | String | 主账号叮当Id |
| expireTime | long | 主账号票据过期时间 |