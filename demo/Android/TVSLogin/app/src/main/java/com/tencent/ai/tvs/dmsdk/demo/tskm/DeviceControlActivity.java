package com.tencent.ai.tvs.dmsdk.demo.tskm;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.dmsdk.demo.ModuleActivity;
import com.tencent.ai.tvs.dmsdk.demo.TSKMActivity;
import com.tencent.ai.tvs.tskm.TVSDeviceControl;

public class DeviceControlActivity extends ModuleActivity {
    private EditText mBlobInfoEditText;
    private EditText mNamespaceEditText;
    private EditText mNameEditText;
    private TVSDeviceControl mTskm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_device_control);

        mBlobInfoEditText = findViewById(R.id.blobInfoEditText);
        mNamespaceEditText = findViewById(R.id.namespaceEditText);
        mNameEditText = findViewById(R.id.nameEditText);

        String productId = getIntent().getStringExtra(TSKMActivity.EXTRA_PRODUCT_ID);
        String dsn = getIntent().getStringExtra(TSKMActivity.EXTRA_DSN);
        String accountId = getIntent().getStringExtra(TSKMActivity.EXTRA_ACCOUNT_ID);
        mTskm = !TextUtils.isEmpty(accountId) ? new TVSDeviceControl(productId, dsn, accountId) : new TVSDeviceControl(productId, dsn);

        findViewById(R.id.bindDeviceButton).setOnClickListener(v -> mTskm.bindDevice(new SimpleTVSCallback1<String>("BindDevice") {
            @Override
            protected String loggableResult(String result) {
                return result;
            }
        }));
        findViewById(R.id.sendMessageButton).setOnClickListener(v ->
                mTskm.controlDevice(mNamespaceEditText.getText().toString(), mNameEditText.getText().toString(), mBlobInfoEditText.getText().toString(), new SimpleTVSCallback1<String>("SendMessage") {
                    @Override
                    protected String loggableResult(String result) {
                return result;
            }
                })
        );
    }
}
