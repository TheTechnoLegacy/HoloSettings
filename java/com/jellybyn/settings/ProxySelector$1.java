package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class ProxySelector$1 implements OnClickListener {
    final /* synthetic */ ProxySelector this$0;

    public void onClick(View view) {
        if (this.this$0.saveToDb()) {
            this.this$0.getActivity().onBackPressed();
        }
    }

    ProxySelector$1(ProxySelector proxySelector) {
        this.this$0 = proxySelector;
    }
}