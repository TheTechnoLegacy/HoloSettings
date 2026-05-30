package com.jellybyn.settings;

import android.webkit.WebView;
import android.webkit.WebViewClient;

class SettingsSafetyLegalActivity$1 extends WebViewClient {
    final /* synthetic */ SettingsSafetyLegalActivity this$0;

    public void onPageFinished(WebView webView, String str) {
        SettingsSafetyLegalActivity.access$000(this.this$0).setTitle(this.this$0.getString(2131428277));
    }

    public void onReceivedError(WebView webView, int i, String str, String str2) {
        SettingsSafetyLegalActivity.access$100(this.this$0, str2);
    }

    SettingsSafetyLegalActivity$1(SettingsSafetyLegalActivity settingsSafetyLegalActivity) {
        this.this$0 = settingsSafetyLegalActivity;
    }
}