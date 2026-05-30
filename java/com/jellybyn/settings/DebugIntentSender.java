package com.jellybyn.settings;

import android.app.Activity;
import android.os.Bundle;
import android.text.Selection;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

public class DebugIntentSender extends Activity {
    private EditText mAccountField;
    private OnClickListener mClicked = new 1(this);
    private EditText mDataField;
    private EditText mIntentField;
    private EditText mResourceField;
    private Button mSendBroadcastButton;
    private Button mStartActivityButton;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968632);
        this.mIntentField = (EditText) findViewById(2131230880);
        this.mIntentField.setText("android.intent.action.SYNC");
        Selection.selectAll(this.mIntentField.getText());
        this.mDataField = (EditText) findViewById(2131230881);
        this.mDataField.setBackgroundResource(17301528);
        this.mAccountField = (EditText) findViewById(2131230882);
        this.mResourceField = (EditText) findViewById(2131230883);
        this.mSendBroadcastButton = (Button) findViewById(2131230884);
        this.mSendBroadcastButton.setOnClickListener(this.mClicked);
        this.mStartActivityButton = (Button) findViewById(2131230885);
        this.mStartActivityButton.setOnClickListener(this.mClicked);
    }
}