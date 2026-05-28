package com.jellybyn.settings.wfd;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.hardware.display.WifiDisplay;
import android.widget.EditText;

class WifiDisplaySettings$2 implements OnClickListener {
    final /* synthetic */ WifiDisplaySettings this$0;
    final /* synthetic */ WifiDisplay val$display;
    final /* synthetic */ EditText val$nameEditText;

    public void onClick(DialogInterface dialogInterface, int i) {
        String name = this.val$nameEditText.getText().toString().trim();
        if (name.isEmpty() || name.equals(this.val$display.getDeviceName())) {
            name = null;
        }
        WifiDisplaySettings.access$100(this.this$0).renameWifiDisplay(this.val$display.getDeviceAddress(), name);
    }

    WifiDisplaySettings$2(WifiDisplaySettings wifiDisplaySettings, EditText editText, WifiDisplay wifiDisplay) {
        this.this$0 = wifiDisplaySettings;
        this.val$nameEditText = editText;
        this.val$display = wifiDisplay;
    }
}