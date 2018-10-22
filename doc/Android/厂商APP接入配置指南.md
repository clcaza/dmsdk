# Android厂商APP接入配置指南 #
## 1、注册AppId ##
在[微信开放平台](https://open.weixin.qq.com/)和[QQ互联平台](https://connect.qq.com/index.html)注册AppId。
## 2、gradle配置 ##
打开工程app目录下的build.gradle</br>
（1）确保defaultConfig下的applicationId为微信开放平台下注册的包名。</br>
（2）确保signingConfigs目录下storeFile.file参数路径正确，keyAlias、keyPassword、storePassword均与微信开放平台下签名参数一致。</br>
（3）配置dependencies</br>
api(name:'tvsloginlib-release', ext:'aar')</br>
api 'com.android.support:appcompat-v7:27.1.1'</br>
api 'com.android.support.constraint:constraint-layout:1.0.2'</br>
api 'com.tencent.mm.opensdk:wechat-sdk-android-with-mta:+'</br>
api 'com.google.zxing:core:3.3.0'</br>
api 'com.android.support:design:27.1.1'</br>
api 'com.squareup.okhttp3:okhttp:3.8.1'</br>
api 'com.google.code.gson:gson:2.8.1'</br>
（4）配置flatDir</br>
repositories {</br>
    flatDir {</br>
        dirs 'libs'</br>
    }</br>
}</br>
（5）确保minSdkVersion大于等于15。</br>
（6）如有别的module需要引用这个aar所在的module，需要在另一个module的gradle里配置如下
repositories {</br>
    flatDir {</br>
        dirs project(':[aarmodulename]').file('libs')</br>
    }</br>
}</br>
## 3、aar配置 ##
将tvsloginlib-release.aar放入app\libs目录下。
## 4、Manifest配置 ##
打开工程AndroidManifest.xml</br>
（1）确保package名称与微信开放平台下注册的包名一致。</br>
（2）将application的name改为com.tencent.ai.tvs.LoginApplication，或工程中自定义的继承自LoginApplication的Application类，并添加android:exported=”true”属性。</br>
（3）配置QQ互联回调
&lt;activity</br>
	android:name="com.tencent.tauth.AuthActivity"</br>
	android:noHistory="true"</br>
	android:launchMode="singleTask" &gt;</br>
	&lt;intent-filter></br>
		&lt;action android:name="android.intent.action.VIEW" /&gt;</br>
		&lt;category android:name="android.intent.category.DEFAULT" /&gt;</br>
		&lt;category android:name="android.intent.category.BROWSABLE" /&gt;</br>
		&lt;data android:scheme="QQ互联APPID" /&gt;</br>
	&lt;/intent-filter&gt;</br>
&lt;/activity&gt;</br>
（4）配置QRomWupProvider
&lt;provider</br>
	android:name="qrom.component.wup.runInfo.QRomWupProvider"</br>
	android:exported="true"</br>
	android:process=":tcm_service"</br>
	android:authorities="应用主包名.wup.QRomProvider" /&gt;</br>
## 5、配置QRom Config类 ##
在工程内增加类</br>
qrom.component.config.QromLogConfig和qrom.component.config.QromWupConfig</br>
package qrom.component.config;</br>
import qrom.component.log.QRomLogBaseConfig;</br>
public class QRomLogConfig extends QRomLogBaseConfig {</br>
	@Override</br>
	public int getLogMode() {</br>
		return QRomLogBaseConfig.LOG_BOTH;</br>
	}</br>
	@Override</br>
	public String getPackageName() {</br>
		return "应用主包名";</br>
	}</br>
}</br>

package qrom.component.config;</br>
import qrom.component.wup.QRomWupBaseConfig;</br>
public class QRomWupConfig extends QRomWupBaseConfig {</br>
	private static final boolean FORCE_WUP_FOR_TEST = false;</br>
	@Override</br>
	public String getAppPackageName() {</br>
		return "应用主包名";</br>
	}</br>
	@Override</br>
	public boolean isRunTestForced() {</br>
		return FORCE_WUP_FOR_TEST;</br>
	}</br>
	@Override</br>
	public String getTestWupProxyAddr() {</br>
		return super.getTestWupProxyAddr();</br>
	}</br>
	@Override
	public String getTestWupSocketProxyAddr() {</br>
		return super.getTestWupSocketProxyAddr();</br>
	}</br>
}</br>

# Q&A #
<li>1、必须接入手机SDK吗
是的。无论设备端接的是SDK方案还是云端API的方案，在伴随APP上都需要接入手机SDK，来做帐号授权、设备绑定、音乐服务授权、云端闹钟管理、音色控制选择等操作。
<li>2、什么时机需要主动触发刷票</li>
（1）APP启动时</br>
（2）从APP给设备传递ClientId之前</br>
（3）APP需要Token操作的时候</br></br>
<li>3、云端绑定有何作用</li>
云端绑定可以作为服务请求合法性校验的一个重要维度，并可以实现APP上设备管理绑定解绑查看等功能，并为推送功能做好基础</br></br>
<li>4、可以自己实现Application吗</li>
如果不想用SDK里的LoginApplication，或不想继承这个，您可以自己实现Application，但必须在onCreate方法里注册我们后台服务
<pre><code>LoginWupManager.getInstance(getApplicationContext()).startUp();</code></pre></br>


# 附言：Android厂商APP设备管理接入 #
## 开发指南 ##
### 一、设备绑定逻辑图 ###
![](image/devicebind.png)
### 二、厂商APP接入TVS设备管理系统配置步骤 ###
#### 1、aar配置 ####
将tvsdevicelib-release.aar，放入app\libs目录下
#### 2、gradle配置 ####
在build.gradle将以下参数配置在dependencies属性下
<pre><code>compile(name:'tvsdevicelib-release', ext:'aar')
compile 'com.google.code.gson:gson:2.8.1'
compile 'com.squareup.okhttp3:okhttp:3.8.1'</code></pre>
#### 3、manifest配置 ####
（1）确保package名称与微信开放平台下注册的包名一致</br>
（2）将application的name改为com.tencent.ai.tvsdevice.DeviceApplication，添加android:exported=”true”属性</br>
## 名词解释 ##
#### UPnP ####
通用即插即用 （UPnP） 是一种用于 PC 机和智能设备（或仪器）的常见对等网络连接的体系结构，尤其是在家庭中。UPnP 以 Internet 标准和技术（例如 TCP/IP、HTTP 和 XML）为基础，使这样的设备彼此可自动连接和协同工作，从而使网络（尤其是家庭网络）对更多的人成为可能。</br>
#### ProductId ####
产品系列Id，通常在Bot平台生成时即已指定，由AppKey和AppAccessToken组成
#### DSN ####
设备序列号，保证唯一性
## Q&A ##
<li>1、APP和设备如何建立连接</li>
目前APP的SDK支持三种连接方式，推荐SmartLink方式，在设备SDK端有完整方案</br>
（1）SmartLink</br>
（2）SoftAP</br>
（3）BLE