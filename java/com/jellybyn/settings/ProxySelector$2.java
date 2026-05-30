package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class ProxySelector$2 implements OnClickListener {
    final /* synthetic */ ProxySelector this$0;

    public void onClick(View view) {
        this.this$0.mHostnameField.setText("");
        this.this$0.mPortField.setText("");
        this.this$0.mExclusionListField.setText("");
    }

    ProxySelector$2(ProxySelector proxySelector) {
        this.this$0 = proxySelector;
    }
}