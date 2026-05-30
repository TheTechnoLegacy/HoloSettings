package com.jellybyn.settings;

import android.text.Selection;
import android.text.Spannable;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.widget.TextView;

class ProxySelector$4 implements OnFocusChangeListener {
    final /* synthetic */ ProxySelector this$0;

    public void onFocusChange(View view, boolean z) {
        if (z) {
            Selection.selectAll((Spannable) ((TextView) view).getText());
        }
    }

    ProxySelector$4(ProxySelector proxySelector) {
        this.this$0 = proxySelector;
    }
}