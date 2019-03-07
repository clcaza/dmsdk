# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in E:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
#-keepclassmembers class com.qq.wx.voice.demo.hardwarespeak.Uart.*
-keepattributes InnerClasses
-dontoptimize
-dontwarn *.**
#-dontwarn org.joda.time.**
#-dontwarn org.w3c.dom.**
#-dontwarn com.tencent.bugly.**
#-keep public class com.tencent.bugly.**{*;}
-keep class com.qq.**{*;}
-keep class android.support.v4.**{*;}
-keep class android.support.v7.**{*;}
-keep class android.support.**{*;}

-keep class MTT.**{*;}
-keep class SmartAssistant.**{*;}
-keep class SmartService.**{*;}
-keep class SmartService4Taxi.**{*;}
-keep class TIRI.**{*;}

-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-keepattributes Deprecated
-keepattributes SourceFile
-keepattributes LineNumberTable
-keepattributes Signature
-keepattributes Exceptions

-keepclassmembers class * {
    native <methods>;
}

-keep class android.support.v4.** { *; }
-keep interface android.support.v4.app.** { *; }
-keep public class * extends android.support.v4.**
-keep public class * extends android.app.Fragment
-keep class com.google.zxing.** { *; }
-keep class org.mozilla.intl.chardet.** { *; }
-keep interface com.google.zxing.** { *; }
-keep interface org.mozilla.intl.chardet.** { *; }
-keep public class * extends com.google.zxing.**
-keep public class * extends org.mozilla.intl.chardet.**

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keep class com.tencent.ai.dobby.main.account.base.AccountInfo {*;}

#image cache
#-keep public class com.tencent.common.imagecache.imagepipeline.nativecode.Bitmaps{*;}
#-keep public class com.tencent.common.imagecache.imagepipeline.memory.NativeMemoryChunk{*;}

-keep class com.tencent.feedback.proguard.**{*;}
-keep class com.tencent.feedback.**{*;}

-keep class com.iflytek.**{*;}

-keep class com.tencent.tbs.common.lbs.** {*;}
-keep class com.tencent.map.geolocation.** {*;}
-keep class com.tencent.tencentmap.** {*;}
-keep class ct.* {*;}


-keep public class * extends android.app.Application{
    public <fields>;
    public <methods>;
}

-keep public class * extends android.app.Activity{
	public <fields>;
	public <methods>;
}

-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclasseswithmembers class * {
	public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
	public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepattributes *Annotation*

-keepclasseswithmembernames class *{
	native <methods>;
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keep class qrom.component.log.*{
     public static <fields>;
     public <init>();
}
-keep public class * extends com.taf.JceStruct{*;}
-keep public class com.taf.*{
public * ;
protected * ;
}

-keep public class * extends com.tencent.ai.dobby.x.taf.JceStruct{*;}
-keep public class com.tencent.ai.dobby.x.taf.*{
public * ;
protected * ;
}

-keep public class * extends com.qq.taf.jce.JceStruct {*;}
-keep class qrom.component.config.**
#-libraryjars libs/qrom_component_log.jar
-keep class qrom.component.log.**
-keep class qrom.component.log.** {*;}

-keep class * extends qrom.component.log.**
-keep class * extends qrom.component.log.** {*;}
-keep class TRom.**
-keep class com.tencent.beacon.**
-keep class com.tencent.beacon.** {*;}
-keep class com.tencent.feedback.** {*;}
#-keep class qrom.component.statistic.**
#-keep class qrom.component.statistic.** {*;}
#-libraryjars libs/tbs_sdk_thirdapp_v3.0.0.1038_43000_20170110_144724.jar
-keep class com.tencent.common.utils.** {*;}
-keep class com.tencent.tbs.video.** {*;}

-keep class com.tencent.smtt.**
-keep class com.tencent.smtt.** {*;}

-keep class qrom.component.log.*{
     public static <fields>;
     public <init>();
}

-keep class com.tencent.tms.QubeCommonBaseConfig{*;}

-keepclasseswithmembers class * {
    ... *JNI*(...);
}

-keepclasseswithmembernames class * {
	... *JRI*(...);
}

-keep class **JNI* {*;}

-keep class com.tencent.map.** {*;}
-keep class com.tencent.tbs.common.lbs.** {*;}
-keep class com.tencentmap.lbssdk.serivce.** {*;}

-keep class com.tencent.voice.service.util.** {*;}
-keep class com.tencent.voice.service.layer.** {*;}
-keep class com.tencent.embed.voice.** {*;}
-keep class com.tencent.map.** {*;}

-keep class qrom.component.wup.**
-keep class qrom.component.wup.** {*;}

-keep class * extends qrom.component.wup.**
-keep class * extends qrom.component.wup.** {*;}

-keep public class * extends com.qq.taf.jce.JceStruct {*;}
# ---------------- 反射  ----------------
-keep class qrom.component.config.**
#-libraryjars libs/qrom_component_log.jar
-keep class qrom.component.log.**
-keep class qrom.component.log.** {*;}

-keep class * extends qrom.component.log.**
-keep class * extends qrom.component.log.** {*;}
-keep class TRom.**
-keep class com.tencent.beacon.**
-keep class com.tencent.beacon.** {*;}
-keep class com.tencent.feedback.** {*;}

-keep class com.qq.**{*;}
-keep class android.support.v4.**{*;}
-keep class android.support.v7.**{*;}
-keep class android.support.**{*;}

-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-keepattributes Deprecated
-keepattributes SourceFile
-keepattributes LineNumberTable
-keepattributes Signature
-keepattributes Exceptions

-keepclassmembers class * {
    native <methods>;
}

-keep class android.qrom.tcm.** { *; }
-keep class middle.tcm.** { *; }
-keep class qrom.component.** { *; }

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}


-keep class com.tencent.ai.dobby.main.account.base.AccountInfo {*;}


#-keep public class com.tencent.common.imagecache.imagepipeline.nativecode.Bitmaps{*;}
#-keep public class com.tencent.common.imagecache.imagepipeline.memory.NativeMemoryChunk{*;}


-keep public class * extends com.taf.JceStruct{*;}
-keep public class com.taf.*{
public * ;
protected * ;
}


-keep class com.tencent.feedback.proguard.**{*;}
-keep class com.tencent.feedback.**{*;}


-keep class com.iflytek.**{*;}


-keep class com.tencent.tbs.common.lbs.** {*;}
-keep class com.tencent.map.geolocation.** {*;}
-keep class com.tencent.tencentmap.** {*;}
-keep class ct.* {*;}

-assumenosideeffects class com.tencent.common.utils.LogUtils {
    public static *** d(...);
    public static *** v(...);
}


-keep class net.sourceforge.zbar.** { *; }
-keep interface net.sourceforge.zbar.** { *; }
-dontwarn net.sourceforge.zbar.**

-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep class com.tencent.android.tpush.**  {* ;}
-keep class com.tencent.mid.**  {* ;}


-keep class qrom.component.log.*{
     public static <fields>;
     public <init>();
}

-keep class qrom.component.config.**

-keep class com.a.**
-keep class com.a.** {*;}
-keep class qrom.component.wup.**
-keep class qrom.component.wup.** {*;}

-keep class * extends qrom.component.wup.**
-keep class * extends qrom.component.wup.** {*;}


-keep class qrom.component.log.**
-keep class qrom.component.log.** {*;}

-keep class * extends qrom.component.log.**
-keep class * extends qrom.component.log.** {*;}

-keep class com.tencent.ai.voiceservice.util.** {*;}
-keep class com.tencent.ai.voiceservice.api.** {*;}
-keep class com.tencent.tms.qlauncher.compatibility.** {*;}
-keep class com.tencent.ai.voiceservice.core.manager.** {*;}
-keep class com.tencent.tms.qube.** {*;}

-keep class wehome.** {*;}
-keep class com.tencent.tms.remote.utils.** {*;}
-keep class com.tencent.ai.voiceservice.core.wrapper.** {*;}
-keep class com.tencent.tms.** {*;}
-keep class com.tencent.tms.utils.** {*;}
-keep class SmartService.** {*;}
-keep class com.tencent.ai.dobby.sdk.** {*;}
-keep class com.tencent.ai.dobby.x.** {*;}
-keep class SmartAssistant.** {*;}
-keep class TIRI.** {*;}
-keep class middle.tcm.** {*;}
-keep class TRom.** {*;}
-keep class qrom.component.** {*;}

-keep public enum com.tencent.ai.tvs.env.ELoginPlatform {
    *;
}

-keep public enum com.tencent.ai.tvs.env.ELoginEnv {
    *;
}

-keep public enum com.tencent.ai.tvs.env.EUserAttrType {
    *;
}

-keep public enum com.tencent.ai.tvs.env.ELocationType {
    *;
}

-keep class com.tencent.stat.*{*;}

-keep class com.tencent.mid.*{*;}

-keep class com.google.zxing.*{*;}
#-keep class com.tencent.mm.opensdk.modelbiz.*{*;}
-keep class com.tencent.mm.**{*;}
#-ignorewarnings

-keep class com.tencent.qbar.** {*;}