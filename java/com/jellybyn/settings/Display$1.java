package com.jellybyn.settings;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;

class Display$1 implements OnItemSelectedListener {
    final /* synthetic */ Display this$0;

    public void onItemSelected(AdapterView adapterView, View view, int i, long j) {
        if (i == 0) {
            Display.access$000(this.this$0).fontScale = 0.75f;
        } else if (i == 2) {
            Display.access$000(this.this$0).fontScale = 1.25f;
        } else {
            Display.access$000(this.this$0).fontScale = 1.0f;
        }
        Display.access$100(this.this$0);
    }

    Display$1(Display display) {
        this.this$0 = display;
    }

    public void onNothingSelected(AdapterView adapterView) {
    }
}