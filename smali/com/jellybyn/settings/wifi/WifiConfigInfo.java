package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.widget.TextView;
import java.util.List;

public class WifiConfigInfo extends Activity {
    private TextView mConfigList;
    private WifiManager mWifiManager;

    protected void onResume() {
        super.onResume();
        if (this.mWifiManager.isWifiEnabled()) {
            List configuredNetworks = this.mWifiManager.getConfiguredNetworks();
            StringBuffer stringBuffer = new StringBuffer();
            for (int size = configuredNetworks.size() - 1; size >= 0; size--) {
                stringBuffer.append(configuredNetworks.get(size));
            }
            this.mConfigList.setText(stringBuffer);
            return;
        }
        this.mConfigList.setText(2131427978);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWifiManager = (WifiManager) getSystemService("wifi");
        setContentView(2130968717);
        this.mConfigList = (TextView) findViewById(2131231126);
    }
}