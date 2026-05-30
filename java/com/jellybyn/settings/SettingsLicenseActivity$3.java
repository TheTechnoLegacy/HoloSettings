package com.jellybyn.settings;

import android.webkit.WebView;
import android.webkit.WebViewClient;

class SettingsLicenseActivity$3 extends WebViewClient {
    final /* synthetic */ SettingsLicenseActivity this$0;

    public void onPageFinished(WebView webView, String str) {
        SettingsLicenseActivity.access$200(this.this$0).dismiss();
        if (this.this$0.isResumed()) {
            SettingsLicenseActivity.access$300(this.this$0).show();
        }
    }

    SettingsLicenseActivity$3(SettingsLicenseActivity settingsLicenseActivity) {
        this.this$0 = settingsLicenseActivity;
    }
}