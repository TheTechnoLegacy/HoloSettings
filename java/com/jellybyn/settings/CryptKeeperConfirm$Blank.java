package com.jellybyn.settings;

import android.app.Activity;
import android.app.StatusBarManager;
import android.os.Bundle;
import android.os.Handler;

public class CryptKeeperConfirm$Blank extends Activity {
    private Handler mHandler = new Handler();

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968602);
        if (Utils.isMonkeyRunning()) {
            finish();
        }
        ((StatusBarManager) getSystemService("statusbar")).disable(24576000);
        this.mHandler.postDelayed(new 1(this), 700);
    }
}