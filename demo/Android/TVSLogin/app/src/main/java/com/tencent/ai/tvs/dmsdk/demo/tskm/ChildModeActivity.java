package com.tencent.ai.tvs.dmsdk.demo.tskm;

import android.os.Bundle;
import android.widget.EditText;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.dmsdk.demo.ModuleActivity;
import com.tencent.ai.tvs.dmsdk.demo.TSKMActivity;
import com.tencent.ai.tvs.tskm.TVSChildMode;

public class ChildModeActivity extends ModuleActivity {
    private EditText mBlobInfoEditText;
    private TVSChildMode mTskm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_child_mode);

        mBlobInfoEditText = findViewById(R.id.blobInfoEditText);

        String productId = getIntent().getStringExtra(TSKMActivity.EXTRA_PRODUCT_ID);
        String dsn = getIntent().getStringExtra(TSKMActivity.EXTRA_DSN);
        mTskm = new TVSChildMode(productId, dsn);

        findViewById(R.id.getButton).setOnClickListener(v -> mTskm.getConfig(mBlobInfoEditText.getText().toString(), new SimpleTVSCallback1<String>("GetConfig") {
            @Override
            protected String loggableResult(String result) {
                return result;
            }
        }));
        findViewById(R.id.setButton).setOnClickListener(v -> mTskm.setConfig(mBlobInfoEditText.getText().toString(), new SimpleTVSCallback1<String>("SetConfig") {
            @Override
            protected String loggableResult(String result) {
                return result;
            }
        }));
    }
}
