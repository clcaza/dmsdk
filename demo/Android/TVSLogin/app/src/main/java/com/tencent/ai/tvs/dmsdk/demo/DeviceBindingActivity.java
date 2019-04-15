package com.tencent.ai.tvs.dmsdk.demo;

import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.ConstantValues;
import com.tencent.ai.tvs.LoginProxy;
import com.tencent.ai.tvs.core.account.TVSAccountInfo;
import com.tencent.ai.tvs.core.common.TVSDevice;
import com.tencent.ai.tvs.core.common.TVSDeviceBindType;
import com.tencent.ai.tvs.tskm.TVSThirdPartyAuth;

import java.util.ArrayList;

public class DeviceBindingActivity extends ModuleActivity {
    private EditText mProductIDEditText;
    private EditText mDSNEditText;
    private TVSDevice mQueriedDevice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_device_binding);


        mProductIDEditText = findViewById(R.id.productIDEditText);
        mDSNEditText = findViewById(R.id.dsnEditText);
        findViewById(R.id.bindButton).setOnClickListener(v -> LoginProxy.getInstance().bindPushDevice(getDevice(), new SimpleTVSCallback("绑定")));
        findViewById(R.id.unbindButton).setOnClickListener(v -> LoginProxy.getInstance().unbindPushDevice(getDevice(), new SimpleTVSCallback("解绑")));
        findViewById(R.id.queryDeviceButton).setOnClickListener(v -> LoginProxy.getInstance().getDeviceInfoListByAccount(TVSDeviceBindType.TVS_SPEAKER, new SimpleTVSCallback1<ArrayList<TVSDevice>>("帐号查设备") {
            @Override
            protected String loggableResult(ArrayList<TVSDevice> result) {
                StringBuilder lines = new StringBuilder();
                for (TVSDevice device : result) {
                    lines.append("Device: ProductID = ").append(device.productID).append(", DSN = ").append(device.dsn).append("\n");
                }
                return lines.toString();
            }
        }));

        findViewById(R.id.queryDeviceGuidButton).setOnClickListener(v -> LoginProxy.getInstance().getDeviceInfoListByDSN(TVSDeviceBindType.TVS_SPEAKER, DemoConstant.PRODUCT_ID, DemoConstant.DSN, new SimpleTVSCallback1<ArrayList<TVSDevice>>("帐号查设备") {
            @Override
            protected String loggableResult(ArrayList<TVSDevice> result) {
                StringBuilder lines = new StringBuilder();
                for (TVSDevice device : result) {
                    mQueriedDevice = new TVSDevice();
                    mQueriedDevice.productID = device.productID;
                    mQueriedDevice.dsn = device.dsn;
                    mQueriedDevice.guid = device.guid;
                    lines.append("Device: GUID = ").append(device.guid).append("\n");
                }
                return lines.toString();
            }
        }));

        findViewById(R.id.queryAccountButton).setOnClickListener(v -> LoginProxy.getInstance().getBoundAccount(getDevice(), new SimpleTVSCallback1<TVSAccountInfo>("设备查帐号", false) {
            @Override
            protected String loggableResult(TVSAccountInfo result) {
                return "OpenID = " + result.getOpenID();
            }
        }));
        findViewById(R.id.toCloudDDWebButton).setOnClickListener(v -> {
            Intent intent = new Intent(this, WebActivity.class);
            intent.putExtra("devInfo", mQueriedDevice);
            intent.putExtra("targetUrl", ConstantValues.VALID_USERCENTER_TESTENV_URL + ConstantValues.TSKAUTHMGR_URL);
            startActivity(intent);
        });
        findViewById(R.id.toCloudDDNativeButton).setOnClickListener(v -> { TVSThirdPartyAuth.requestCloudDDAuth(DeviceBindingActivity.this, mQueriedDevice, "com.tencent.ai.tvs.dmsdk.demo.DeviceBindingActivity"); });
    }

    private TVSDevice getDevice() {
        TVSDevice device = new TVSDevice();
        if (mProductIDEditText.getText().toString().equals("")) {
            device.productID = DemoConstant.PRODUCT_ID;
        }
        else {
            device.productID = mProductIDEditText.getText().toString();
        }
        if (mDSNEditText.getText().toString().equals("")) {
            device.dsn = DemoConstant.DSN;
        }
        else {
            device.dsn = mDSNEditText.getText().toString();
        }
        // 这里使用TVS方案，字段填入规则请阅读LoginProxy#bindPushDevice的文档！
        device.bindType = TVSDeviceBindType.TVS_SPEAKER;
        device.pushIDExtra = "TVSSpeaker";
        return device;
    }
}
