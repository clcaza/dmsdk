package com.tencent.ai.tvs.dmsdk.demo.tskm;

import android.os.Bundle;
import android.widget.EditText;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.dmsdk.demo.ModuleActivity;
import com.tencent.ai.tvs.dmsdk.demo.TSKMActivity;
import com.tencent.ai.tvs.tskm.TVSAlarm;

public class AlarmActivity extends ModuleActivity {
    private EditText mBlobInfoEditText;
    private TVSAlarm mTskm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alarm);

        mBlobInfoEditText = findViewById(R.id.blobInfoEditText);

        String productId = getIntent().getStringExtra(TSKMActivity.EXTRA_PRODUCT_ID);
        String dsn = getIntent().getStringExtra(TSKMActivity.EXTRA_DSN);
        mTskm = new TVSAlarm(productId, dsn);

        findViewById(R.id.sendButton).setOnClickListener(v -> mTskm.manage(mBlobInfoEditText.getText().toString(), new SimpleTVSCallback1<String>("Alarm") {
            @Override
            protected String loggableResult(String result) {
                return result;
            }
        }));
    }
}
