package com.jellybyn.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MediaFormat extends Activity {
    private Button mFinalButton;
    private OnClickListener mFinalClickListener = new 1(this);
    private View mFinalView;
    private LayoutInflater mInflater;
    private View mInitialView;
    private Button mInitiateButton;
    private OnClickListener mInitiateListener = new 2(this);

    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 55) {
            if (i2 == -1) {
                establishFinalConfirmationState();
            } else if (i2 == 0) {
                finish();
            } else {
                establishInitialState();
            }
        }
    }

    private void establishFinalConfirmationState() {
        if (this.mFinalView == null) {
            this.mFinalView = this.mInflater.inflate(2130968645, null);
            this.mFinalButton = (Button) this.mFinalView.findViewById(2131230908);
            this.mFinalButton.setOnClickListener(this.mFinalClickListener);
        }
        setContentView(this.mFinalView);
    }

    private void establishInitialState() {
        if (this.mInitialView == null) {
            this.mInitialView = this.mInflater.inflate(2130968646, null);
            this.mInitiateButton = (Button) this.mInitialView.findViewById(2131230909);
            this.mInitiateButton.setOnClickListener(this.mInitiateListener);
        }
        setContentView(this.mInitialView);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mInitialView = null;
        this.mFinalView = null;
        this.mInflater = LayoutInflater.from(this);
        establishInitialState();
    }

    public void onPause() {
        super.onPause();
        if (!isFinishing()) {
            establishInitialState();
        }
    }

    private boolean runKeyguardConfirmation(int i) {
        return new ChooseLockSettingsHelper(this).launchConfirmationActivity(i, getText(2131428220), getText(2131428221));
    }
}