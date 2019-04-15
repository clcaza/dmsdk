package com.tencent.ai.tvs.dmsdk.demo;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.tencent.ai.dobbydemo.R;
import com.tencent.ai.tvs.LoginProxy;
import com.tencent.ai.tvs.core.account.AccountInfoManager;
import com.tencent.ai.tvs.dmsdk.demo.tskm.AlarmActivity;
import com.tencent.ai.tvs.dmsdk.demo.tskm.ChildModeActivity;
import com.tencent.ai.tvs.dmsdk.demo.tskm.DeviceControlActivity;

public class TSKMActivity extends AppCompatActivity {
    public static final String EXTRA_PRODUCT_ID = "PRODUCT_ID";
    public static final String EXTRA_DSN = "DSN";
    public static final String EXTRA_ACCOUNT_ID = "ACCOUNT_ID";
    private static final String KEY_ACCOUNT_ID = "accountId";

    private EditText mProductIDEditText;
    private EditText mDSNEditText;
    private EditText mAccountIdEditText;
    private TextView mClientIdTextView;
    private String mClientId = "";
    private SharedPreferences mPref;
    private TextWatcher mUpdateClientIdWatcher = new TextWatcher() {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override
        public void afterTextChanged(Editable s) {
            updateClientId();
        }
    };
    private ClipboardManager mClipboardManager;
    private boolean isThirdParty = false;

    private final View.OnClickListener mOnClickListener = v -> {
        Intent intent = null;
        switch (v.getId()) {
            case R.id.alarmButton:
                intent = new Intent(this, AlarmActivity.class);
                break;
            case R.id.childModeButton:
                intent = new Intent(this, ChildModeActivity.class);
                break;
            case R.id.deviceControlButton:
                intent = new Intent(this, DeviceControlActivity.class);
                break;
        }
        if (intent != null) {
            // Check login!
            if (!isThirdParty && !LoginProxy.getInstance().isTokenExist()) {
                Toast.makeText(this, R.string.login_required, Toast.LENGTH_SHORT).show();
                intent = new Intent(this, AccountActivity.class);
            } else {
                intent.putExtra(EXTRA_PRODUCT_ID, mProductIDEditText.getText().toString());
                intent.putExtra(EXTRA_DSN, mDSNEditText.getText().toString());
                intent.putExtra(EXTRA_ACCOUNT_ID, mAccountIdEditText.getText().toString());
            }
            startActivity(intent);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tskm);
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
        }

        mPref = getSharedPreferences("default", MODE_PRIVATE);

        mClipboardManager = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);

        mClientIdTextView = findViewById(R.id.clientIdTextView);
        mProductIDEditText = findViewById(R.id.productIDEditText);
        mProductIDEditText.setText(DemoConstant.PRODUCT_ID);
        mProductIDEditText.addTextChangedListener(mUpdateClientIdWatcher);
        mDSNEditText = findViewById(R.id.dsnEditText);
        mDSNEditText.setText(DemoConstant.DSN);
        mDSNEditText.addTextChangedListener(mUpdateClientIdWatcher);
        mAccountIdEditText = findViewById(R.id.accountIdEditText);
        mAccountIdEditText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                if (isThirdParty) {
                    setThirdPartyAccountId(s.toString());
                }
            }
        });

        RadioButton dmsdkRadioButton = findViewById(R.id.dmsdkRadioButton);
        dmsdkRadioButton.setOnCheckedChangeListener((buttonView, isChecked) -> {
            if (isChecked) {
                changeMode(false);
            }
        });
        RadioButton thirdPartyRadioButton = findViewById(R.id.thirdPartyRadioButton);
        thirdPartyRadioButton.setOnCheckedChangeListener((buttonView, isChecked) -> {
            if (isChecked) {
                changeMode(true);
            }
        });

        findViewById(R.id.alarmButton).setOnClickListener(mOnClickListener);
        findViewById(R.id.childModeButton).setOnClickListener(mOnClickListener);
        findViewById(R.id.deviceControlButton).setOnClickListener(mOnClickListener);

        findViewById(R.id.copyClientIdButton).setOnClickListener(v -> {
            updateClientId();
            ClipData clipData = ClipData.newPlainText("Client ID", mClientId);
            mClipboardManager.setPrimaryClip(clipData);
            Toast.makeText(this, "Client ID copied to clipboard", Toast.LENGTH_SHORT).show();
        });

        dmsdkRadioButton.setChecked(true);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onResume() {
        super.onResume();
        // Refresh after login and come back to this page
        updateClientId();
    }

    private void changeMode(boolean isThirdParty) {
        this.isThirdParty = isThirdParty;
        mAccountIdEditText.setEnabled(isThirdParty);
        String accountId = isThirdParty ? getThirdPartyAccountId() : AccountInfoManager.getInstance().getOpenID();
        mAccountIdEditText.setText(accountId == null ? "" : accountId);
        updateClientId();
    }

    private String getThirdPartyAccountId() {
        return mPref.getString(KEY_ACCOUNT_ID, "");
    }

    private void setThirdPartyAccountId(String accountId) {
        mPref.edit().putString(KEY_ACCOUNT_ID, accountId).apply();
    }

    private void updateClientId() {
        String productId = mProductIDEditText.getText().toString();
        String dsn = mDSNEditText.getText().toString();
        mClientId = isThirdParty
                ? AccountInfoManager.getClientIdForThirdParty(mAccountIdEditText.getText().toString(), "", "", productId, dsn)
                : AccountInfoManager.getInstance().getClientId(productId, dsn);
        mClientIdTextView.setText("Client ID:" + mClientId);
    }
}
