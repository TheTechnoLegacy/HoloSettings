package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemProperties;

class AccessibilitySettings$5 implements OnClickListener {
    final /* synthetic */ AccessibilitySettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.this$0.removeDialog(1);
        this.this$0.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(SystemProperties.get("ro.screenreader.market", "market://search?q=pname:com.google.android.marvin.talkback"))));
    }

    AccessibilitySettings$5(AccessibilitySettings accessibilitySettings) {
        this.this$0 = accessibilitySettings;
    }
}