package com.tencent.ai.tvs.dmsdk.demo;

import android.os.Bundle;
import android.widget.EditText;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.tskm.TVSTSKM;

public class TSKMActivity extends ModuleActivity {
    private EditText mProductIDEditText;
    private EditText mDSNEditText;
    private EditText mDomainEditText;
    private EditText mIntentEditText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tskm);

        mProductIDEditText = findViewById(R.id.productIDEditText);
        mProductIDEditText.setText("ffb54fb08efe11e8a377658d0db82adb:cdc9a089b0b94747ae60d97f01310589");
        mDSNEditText = findViewById(R.id.dsnEditText);
        mDSNEditText.setText("8989898989880000");
        mDomainEditText = findViewById(R.id.domainEditText);
        mDomainEditText.setText("alarm");
        mIntentEditText = findViewById(R.id.intentEditText);
        mIntentEditText.setText("cloud_manager");

        findViewById(R.id.sendButton).setOnClickListener(v -> {
            String blobInfo = "{\n" +
                    "    \"eType\": 0,\n" +
                    "    \"stCloudAlarmReq\": {\n" +
                    "        \"stAccountBaseInfo\": {\n" +
                    "            \"strAcctId\": \"o05it0dAhgPPVfQXgXiNveqiLHAA\"\n" +
                    "        },\n" +
                    "        \"eCloud_type\": 1,\n" +
                    "        \"sPushInfo\": \"\",\n" +
                    "        \"vCloudAlarmData\": [\n" +
                    "            {\n" +
                    "                \"stAIDeviceBaseInfo\": {\n" +
                    "                    \"strGuid\": \"\",\n" +
                    "                    \"strAppKey\": \"ffb54fb08efe11e8a377658d0db82adb\"\n" +
                    "                },\n" +
                    "                \"eRepeatType\": 1,\n" +
                    "                \"lAlarmId\": 0,\n" +
                    "                \"lStartTimeStamp\": 1549307800\n" +
                    "            }\n" +
                    "        ]\n" +
                    "    }\n" +
                    "}";
            TVSTSKM.requestTSKMUniAccessByDSN(mProductIDEditText.getText().toString(), mDSNEditText.getText().toString(),
                    mDomainEditText.getText().toString(), mIntentEditText.getText().toString(), blobInfo, new SimpleTVSCallback1<String>("TSKM") {
                @Override
                protected String loggableResult(String result) {
                    return result;
                }
            });
        });
    }
}
