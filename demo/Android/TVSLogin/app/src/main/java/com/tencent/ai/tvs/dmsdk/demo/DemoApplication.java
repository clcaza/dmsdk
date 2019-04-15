package com.tencent.ai.tvs.dmsdk.demo;

import android.app.Application;

import com.tencent.ai.tvs.LoginProxy;
import com.tencent.ai.tvs.core.account.TVSAuthDelegate;
import com.tencent.ai.tvs.web.TVSWeb;

public class DemoApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();

        LoginProxy.getInstance().registerApp(this, DemoConstant.APP_ID_WX, DemoConstant.APP_ID_QQ_OPEN);
        TVSWeb.init(new TVSAuthDelegate(this, LoginProxy.getInstance()));
        // 是否在登录成功后检查绑定。一般而言不需要启用。
//        TVSWeb.getConfiguration().setEnableBinding(true);
    }
}
